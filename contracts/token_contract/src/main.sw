contract;

use src_20::SRC20;
use std::{call_frames::contract_id, string::String};
use src_7::{Metadata, SRC7};

configurable {
    TOTAL_SUPPLY: u64 = 100_000_000,
    DECIMALS: u8 = 9u8,
}

impl SRC20 for Contract {
    #[storage(read)]
    fn total_assets() -> u64 {
        1
    }

    #[storage(read)]
    fn total_supply(asset: AssetId) -> Option<u64> {
        if asset == AssetId::default(contract_id()) {
            Some(TOTAL_SUPPLY)
        } else {
            None
        }
    }

    #[storage(read)]
    fn name(asset: AssetId) -> Option<String> {
        if asset == AssetId::default(contract_id()) {
            Some(String::from_ascii_str("MyToken"))
        } else {
            None
        }
    }

    #[storage(read)]
    fn symbol(asset: AssetId) -> Option<String> {
        if asset == AssetId::default(contract_id()) {
            Some(String::from_ascii_str("MYTKN"))
        } else {
            None
        }
    }

    #[storage(read)]
    fn decimals(asset: AssetId) -> Option<u8> {
        if asset == AssetId::default(contract_id()) {
            Some(DECIMALS)
        } else {
            None
        }
    }
}

impl SRC7 for Contract {
    #[storage(read)]
    fn metadata(asset: AssetId, key: String) -> Option<Metadata> {
        if asset == AssetId::default(contract_id()) && key == String::from_ascii_str("tokenURI") {
            Some(Metadata::String(String::from_ascii_str("https://boredapeyachtclub.com/api/mutants/1")))
        } else {
            None
        }
    }
}
