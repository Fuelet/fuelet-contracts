use fuels::prelude::abigen;
use fuels::types::Bits256;
use fuels::types::unresolved_bytes::UnresolvedBytes;

abigen!(Predicate(
    name = "SendMoneyPredicateEncoder",
    abi = "contracts/send_money_predicate/out/debug/send_money_predicate-abi.json"
));

pub fn encode_data(data: Bits256) -> UnresolvedBytes {
    SendMoneyPredicateEncoder::encode_data(data)
}
