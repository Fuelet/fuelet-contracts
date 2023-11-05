use std::fmt::Debug;
use std::str::FromStr;

use fuels::accounts::fuel_crypto::SecretKey;
use fuels::core::traits::{Parameterize, Tokenizable};
use fuels::prelude::{Bech32ContractId, ContractId, Provider, TxParameters, WalletUnlocked};
use fuels::programs::contract::ContractCallHandler;
use fuels::types::AssetId;

pub use crate::bindings::token_contract_binding;
pub use crate::model::metadata;

use self::metadata::Metadata;

// DO NOT USE THIS PRIVATE KEY
// It's present here only for the purpose of reading data from blockchain, cause currently you
// must provide an instance of wallet to interact with smart contracts
const READ_WALLET_PRIVATE_KEY: &str = "e5e05a4ab2919dc01b97c90a48853fd4dfbd204e92e44327375702ab09bb184e";

pub struct TokenContract {
    pub node_url: String,
}

fn convert_asset_id(asset_id_str: &String) -> AssetId {
    AssetId::from_str(asset_id_str.as_str()).unwrap()
}

impl TokenContract {
    pub fn new(node_url: String) -> TokenContract {
        TokenContract { node_url }
    }

    #[tokio::main]
    pub async fn total_assets(
        &self,
        contract_id: String,
    ) -> u64 {
        self.call_contract(contract_id, |m| m.total_assets()).await
    }

    #[tokio::main]
    pub async fn total_supply(
        &self,
        contract_id: String,
        asset_id: String,
    ) -> Option<u64> {
        self.call_contract(contract_id, |m| m.total_supply(convert_asset_id(&asset_id))).await
    }

    #[tokio::main]
    pub async fn name(
        &self,
        contract_id: String,
        asset_id: String,
    ) -> Option<String> {
        self.call_contract(contract_id, |m| m.name(convert_asset_id(&asset_id))).await
    }

    #[tokio::main]
    pub async fn symbol(
        &self,
        contract_id: String,
        asset_id: String,
    ) -> Option<String> {
        self.call_contract(contract_id, |m| m.symbol(convert_asset_id(&asset_id))).await
    }

    #[tokio::main]
    pub async fn decimals(
        &self,
        contract_id: String,
        asset_id: String,
    ) -> Option<u8> {
        self.call_contract(contract_id, |m| m.decimals(convert_asset_id(&asset_id))).await
    }

    #[tokio::main]
    pub async fn metadata(
        &self,
        contract_id: String,
        asset_id: String,
        key: String
    ) -> Option<Metadata> {
        let sway_meta: Option<token_contract_binding::Metadata> = self.call_contract(contract_id, |m| m.metadata(convert_asset_id(&asset_id), key.clone())).await;
        match sway_meta {
            Some(token_contract_binding::Metadata::B256(value)) => None, // TODO: implement proper conversion
            Some(token_contract_binding::Metadata::Bytes(value)) => None, // TODO: implement proper conversion
            Some(token_contract_binding::Metadata::Int(value)) => Some(Metadata::Int(value)),
            Some(token_contract_binding::Metadata::String(value)) => Some(Metadata::String(value)),
            _ => None
        }
    }

    async fn call_contract<F, D>(&self, contract_id_str: String, method: F) -> D where
        D: Tokenizable + Parameterize + Debug,
        F: Fn(token_contract_binding::TokenContractAbiMethods<WalletUnlocked>) -> ContractCallHandler<WalletUnlocked, D> {
        let read_wallet = self.create_read_wallet().await;
        let contract_id: ContractId = ContractId::from_str(contract_id_str.as_str()).unwrap();
        let bech32_contract_id = Bech32ContractId::from(contract_id);
        let contract_instance = token_contract_binding::create_token_contract_instance(bech32_contract_id, read_wallet);
        let tx_params = TxParameters::new(Some(1), Some(10_000_000), 0);
        let methods = contract_instance.methods();
        let response = method(methods)
            .tx_params(tx_params)
            .simulate()
            .await
            .unwrap();
        response.value
    }

    async fn create_read_wallet(&self) -> WalletUnlocked {
        let provider = Provider::connect(&self.node_url).await.unwrap();
        let secret_key = SecretKey::from_str(READ_WALLET_PRIVATE_KEY).unwrap();
        WalletUnlocked::new_from_private_key(secret_key, Some(provider))
    }
}
