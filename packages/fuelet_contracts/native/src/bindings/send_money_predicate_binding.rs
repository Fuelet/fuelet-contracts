use fuels::prelude::abigen;
use fuels::types::B512;
use fuels::types::unresolved_bytes::UnresolvedBytes;

abigen!(Predicate(
    name = "SendMoneyPredicateEncoder",
    abi = "contracts/send_money_predicate/out/debug/send_money_predicate-abi.json"
));

pub fn encode_data(data: B512) -> UnresolvedBytes {
    SendMoneyPredicateEncoder::encode_data(data)
}
