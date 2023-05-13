use fuels::prelude::{abigen, Bech32ContractId};
use fuels_accounts::WalletUnlocked;

abigen!(Contract(
    name = "TokenContractAbi",
    abi = "contracts/token_contract/out/debug/token_contract-abi.json"
));

pub fn create_token_contract_instance(bech32_contract_id: Bech32ContractId,
                                      wallet: WalletUnlocked) -> TokenContractAbi<WalletUnlocked> {
    TokenContractAbi::new(bech32_contract_id, wallet)
}