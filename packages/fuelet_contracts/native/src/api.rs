use std::str::FromStr;

use flutter_rust_bridge::RustOpaque;
pub use fuels::prelude::*;
use fuels::signers::fuel_crypto::SecretKey;

const READ_WALLET_PRIVATE_KEY: &str = "e5e05a4ab2919dc01b97c90a48853fd4dfbd204e92e44327375702ab09bb184e";

abigen!(Contract(
         name = "TokenContractAbi",
         abi = "packages/fuelet_contracts/native/contracts/token_contract-abi.json"
     ));

pub struct TokenContract {
    pub read_wallet: RustOpaque<WalletUnlocked>,
}

impl TokenContract {
    #[tokio::main]
    pub async fn new(node_url: String) -> TokenContract {
        let provider = Provider::connect(node_url).await.unwrap();
        let secret_key = SecretKey::from_str(READ_WALLET_PRIVATE_KEY).unwrap();
        let read_wallet = WalletUnlocked::new_from_private_key(secret_key,
                                                               Some(provider));
        TokenContract { read_wallet: RustOpaque::new(read_wallet) }
    }

    #[tokio::main]
    pub async fn call_contract(
        &self,
        contract_id: String,
    ) -> String {
        let address: ContractId = ContractId::from_str(contract_id.as_str()).unwrap();
        let bech32_contract_id = Bech32ContractId::from(address);
        let contract_instance = TokenContractAbi::new(bech32_contract_id, (*self.read_wallet).clone());
        let response = contract_instance
            .methods()
            .config()
            .simulate()
            .await
            .unwrap();
        response.value.name.into()
    }
}
