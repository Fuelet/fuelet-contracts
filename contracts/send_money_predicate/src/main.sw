predicate;

use std::{b512::B512, ecr::{ec_recover_address}};

// TODO : Remove once __gtf getters implemented in std-lib
const GTF_OUTPUT_COIN_TO = 0x202;

const SECRET_PUBLIC_KEY = 0x3b421fbbb41ae9aa69028615c34811125d057eb033e4b39e1d8957dc434d7145;

fn main(signature: B512) -> bool {
    let receiver = Address::from(__gtf::<b256>(0, GTF_OUTPUT_COIN_TO));
    let signed_message = receiver.value;
    let recovered_address = ec_recover_address(signature, signed_message).unwrap();
    recovered_address.value == SECRET_PUBLIC_KEY
}
