use std::str::FromStr;

pub use fuels::prelude::{abigen, Bech32ContractId, ContractId, Provider, WalletUnlocked};
use fuels::signers::fuel_crypto::SecretKey;

pub use crate::model::token_initialize_config::TokenInitializeConfigModel;

const READ_WALLET_PRIVATE_KEY: &str = "e5e05a4ab2919dc01b97c90a48853fd4dfbd204e92e44327375702ab09bb184e";

abigen!(Contract(
    name = "TokenContractAbi",
    abi = "packages/fuelet_contracts/native/contracts/token_contract/out/debug/token_contract-abi.json"
));

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
        let contract_instance = TokenContractAbi::new(bech32_contract_id, read_wallet);
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
