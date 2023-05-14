use std::str::FromStr;

use fuels::accounts::fuel_crypto::SecretKey;
use fuels::accounts::predicate::Predicate;
use fuels::prelude::{Account, BASE_ASSET_ID, Bech32Address, Bech32ContractId, ContractId, Provider, ScriptTransaction, Transaction, TxParameters, ViewOnlyAccount, WalletUnlocked};
use fuels::types::transaction_builders::TransactionBuilder;
use fuels::types::{AssetId, Bits256};
use fuels::types::transaction_builders::ScriptTransactionBuilder;

pub use crate::bindings::{send_money_predicate_binding, token_contract_binding};
pub use crate::model::token_initialize_config::TokenInitializeConfigModel;

// DO NOT USE THIS PRIVATE KEY
// It's present here only for the purpose of reading data from blockchain, cause currently you
// must provide an instance of wallet to interact with smart contracts
const READ_WALLET_PRIVATE_KEY: &str = "e5e05a4ab2919dc01b97c90a48853fd4dfbd204e92e44327375702ab09bb184e";

pub struct TokenContract {
    pub node_url: String,
}

impl TokenContract {
    pub fn new(node_url: String) -> TokenContract {
        TokenContract { node_url }
    }

    #[tokio::main]
    pub async fn config(
        &self,
        contract_id: String,
    ) -> TokenInitializeConfigModel {
        let read_wallet = self.create_read_wallet().await;
        let address: ContractId = ContractId::from_str(contract_id.as_str()).unwrap();
        let bech32_contract_id = Bech32ContractId::from(address);
        let contract_instance = token_contract_binding::create_token_contract_instance(bech32_contract_id, read_wallet);
        let response = contract_instance
            .methods()
            .config()
            .simulate()
            .await
            .unwrap();
        TokenInitializeConfigModel {
            name: response.value.name.into(),
            symbol: response.value.symbol.into(),
            decimals: response.value.decimals.into(),
        }
    }

    async fn create_read_wallet(&self) -> WalletUnlocked {
        let provider = Provider::connect(&self.node_url).await.unwrap();
        let secret_key = SecretKey::from_str(READ_WALLET_PRIVATE_KEY).unwrap();
        WalletUnlocked::new_from_private_key(secret_key, Some(provider))
    }
}

pub struct SendCoinsPredicate {
    pub node_url: String,
    pub code: Vec<u8>,
}

impl SendCoinsPredicate {
    pub fn new(node_url: String, code_hex: String) -> SendCoinsPredicate {
        let code = hex::decode(code_hex).unwrap();
        SendCoinsPredicate { node_url, code }
    }

    pub fn address(&self) -> String {
        let pred = self.get_predicate_instance();
        pred.address().to_string()
    }

    fn get_predicate_instance(&self) -> Predicate {
        Predicate::from_code(self.code.clone())
    }

    #[tokio::main]
    pub async fn transfer_to(&self, to: String, secret: String, amount: u64) -> String {
        let provider = Provider::connect(&self.node_url).await.unwrap();
        let predicate_data = Bits256::from_hex_str(secret.as_str()).unwrap();
        let recipient = Bech32Address::from_str(to.as_str()).unwrap();
        let tx_params = TxParameters::default()
            .set_gas_price(1)
            .set_gas_limit(10_000_000)
            .set_maturity(0);
        let tx = self.create_transfer_tx(&recipient, amount, BASE_ASSET_ID, tx_params, &provider, Some(predicate_data)).await;
        provider.send_transaction(&tx).await.unwrap();
        tx.id().to_string()
    }

    async fn create_transfer_tx(
        &self,
        to: &Bech32Address,
        amount: u64,
        asset_id: AssetId,
        tx_parameters: TxParameters,
        provider: &Provider,
        predicate_data: Option<Bits256>,
    ) -> ScriptTransaction {
        let mut predicate: Predicate = self.get_predicate_instance()
            .with_provider(provider.clone());
        predicate = match predicate_data {
            Some(data) => {
                let encoded_data = send_money_predicate_binding::encode_data(data);
                predicate.with_data(encoded_data)
            }
            None => predicate,
        };
        let inputs = predicate
            .get_asset_inputs_for_amount(asset_id, amount, None)
            .await
            .unwrap();

        let outputs = predicate.get_asset_outputs_for_amount(to, asset_id, amount);

        let consensus_parameters = predicate
            .try_provider()
            .unwrap()
            .chain_info()
            .await
            .unwrap()
            .consensus_parameters;

        let tx_builder = ScriptTransactionBuilder::prepare_transfer(inputs, outputs, tx_parameters)
            .set_consensus_parameters(consensus_parameters);

        // if we are not transferring the base asset, previous base amount is 0
        let previous_base_amount = if asset_id == AssetId::default() {
            amount
        } else {
            0
        };

        let tx = predicate
            .add_fee_resources(tx_builder, previous_base_amount, None)
            .await
            .unwrap();

        tx
    }
}