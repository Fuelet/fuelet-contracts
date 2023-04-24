library;

use std::{identity::Identity};

pub struct Transfer {
    from: Identity,
    to: Identity,
    tokenId: u64,
}

pub struct Approval {
    owner: Identity,
    approved: Identity,
    tokenId: u64,
}

pub struct ApprovalForAll {
    owner: Identity,
    operator: Identity,
    approved: bool,
}

pub struct TokenMetaData {
    // This is left as an example. Support for dynamic length string is needed here
    name: str[7],
    symbol: str[7],
    // Represents 46 char IPFS CID and token_id
    token_uri: (str[46], u64),
}

impl TokenMetaData {
    pub fn new(token_id: u64) -> Self {
        Self {
            name: "Thunder",
            symbol: "THUNDER",
            token_uri: ("QmQFkLSQysj94s5GvTHPyzTxrawwtjgiiYS2TBLgrvw8CW", token_id),
        }
    }
}

abi IERC721 {
    #[storage(read)]
    fn balanceOf(user: Identity) -> u64;

    #[storage(read)]
    fn ownerOf(tokenId: u64) -> Identity;

    #[storage(read, write)]
    fn initialize(maxSupply: u64, transferManager: ContractId);

    #[storage(read, write)]
    fn safeTransferFrom(from: Identity, to: Identity, tokenId: u64);

    #[storage(read, write)]
    fn transferFrom(from: Identity, to: Identity, tokenId: u64);

    #[storage(read, write)]
    fn approve(to: Identity, tokenId: u64);

    #[storage(write)]
    fn setApprovalForAll(operator: Identity, approved: bool);

    #[storage(read)]
    fn maxSupply() -> u64;

    #[storage(read)]
    fn totalSupply() -> u64;

    #[storage(read, write)]
    fn mint(amount: u64, to: Identity);

    #[storage(read)]
    fn metadata(tokenId: u64) -> TokenMetaData;

    #[storage(read)]
    fn getApproved(tokenId: u64) -> Identity;

    #[storage(read)]
    fn isApprovedForAll(user: Identity, operator: Identity) -> bool;

    /// ERC165
    fn supportsInterface(interfaceId: u64) -> bool;

    /// Ownable
    #[storage(read)]
    fn owner() -> Option<Identity>;
}
