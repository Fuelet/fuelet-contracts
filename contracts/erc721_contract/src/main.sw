contract;

mod interface;

use libraries::{msg_sender_address::*, ownable::*, constants::*};
use interface::{IERC721::*, errors::*};
use std::{
    auth::msg_sender,
    identity::Identity,
    logging::log,
    option::Option,
    result::Result,
    revert::require,
    storage::StorageMap,
};

storage {
    approved: StorageMap<u64, Option<Identity>> = StorageMap {},
    balances: StorageMap<Identity, u64> = StorageMap {},
    max_supply: u64 = 0,
    meta_data: StorageMap<u64, TokenMetaData> = StorageMap {},
    operator_approval: StorageMap<(Identity, Identity), bool> = StorageMap {},
    owners: StorageMap<u64, Option<Identity>> = StorageMap {},
    tokens_minted: u64 = 0,
    total_supply: u64 = 0,
}

impl IERC721 for Contract {
    #[storage(read)]
    fn owner() -> Option<Identity> {
        owner()
    }

    #[storage(read, write)]
    fn approve(to: Identity, tokenId: u64) {
        let approved = Option::Some(to);
        let token_owner = storage.owners.get(tokenId).unwrap();
        require(token_owner.is_some(), InputError::TokenDoesNotExist);

        // Ensure that the sender is the owner of the token to be approved
        let sender = msg_sender().unwrap();
        require(token_owner.unwrap() == sender, AccessError::SenderNotOwner);

        // Set and store the `approved` `Identity`
        storage.approved.insert(tokenId, approved);

        log(Approval {
            owner: sender,
            approved: to,
            tokenId,
        });
    }

    #[storage(read)]
    fn getApproved(tokenId: u64) -> Identity {
        let approved = storage.approved.get(tokenId);
        require(approved.is_some(), InputError::ApprovedDoesNotExist);
        approved.unwrap().unwrap()
    }

    #[storage(read)]
    fn balanceOf(user: Identity) -> u64 {
        storage.balances.get(user).unwrap_or(0)
    }

    #[storage(read, write)]
    fn initialize(maxSupply: u64, transferManager: ContractId) {
        require(maxSupply != 0, InputError::TokenSupplyCannotBeZero);
        let caller = msg_sender().unwrap();
        set_ownership(caller);

        storage.max_supply = maxSupply;
        storage.transfer_manager = transferManager;
    }

    #[storage(read)]
    fn isApprovedForAll(user: Identity, operator: Identity) -> bool {
        storage.operator_approval.get((user, operator)).unwrap_or(false)
    }

    #[storage(read)]
    fn maxSupply() -> u64 {
        storage.max_supply
    }

    #[storage(read, write)]
    fn mint(amount: u64, to: Identity) {
        let tokens_minted = storage.tokens_minted;
        let total_mint = tokens_minted + amount;
        // The current number of tokens minted plus the amount to be minted cannot be
        // greater than the total supply
        require(storage.max_supply >= total_mint, InputError::NotEnoughTokensToMint);

        // Mint as many tokens as the sender has asked for
        let mut index = tokens_minted;
        while index < total_mint {
            // Create the TokenMetaData for this new token
            storage.meta_data.insert(index, TokenMetaData::new(index));
            storage.owners.insert(index, Option::Some(to));
            index += 1;
        }

        storage.balances.insert(to, storage.balances.get(to).unwrap_or(0) + amount);
        storage.tokens_minted = total_mint;
        storage.total_supply += amount;
    }

    #[storage(read)]
    fn metadata(tokenId: u64) -> TokenMetaData {
        require(tokenId < storage.tokens_minted, InputError::TokenDoesNotExist);
        storage.meta_data.get(tokenId).unwrap()
    }

    #[storage(read)]
    fn ownerOf(tokenId: u64) -> Identity {
        let ownerOfToken = storage.owners.get(tokenId).unwrap();
        require(ownerOfToken.is_some(), InputError::OwnerDoesNotExist);
        ownerOfToken.unwrap()
    }

    #[storage(write)]
    fn setApprovalForAll(operator: Identity, approved: bool) {
        // Store `approve` with the (sender, operator) tuple
        let sender = msg_sender().unwrap();
        storage.operator_approval.insert((sender, operator, ), approved);

        log(ApprovalForAll {
            owner: sender,
            operator,
            approved,
        });
    }

    fn supportsInterface(interfaceId: u64) -> bool {
        match interfaceId {
            ERC721_INTERFACE_ID => true,
            _ => false,
        }
    }

    #[storage(read)]
    fn totalSupply() -> u64 {
        storage.total_supply
    }

    #[storage(read, write)]
    fn safeTransferFrom(from: Identity, to: Identity, tokenId: u64) {
        // Make sure the `tokenId` maps to an existing token
        let token_owner = storage.owners.get(tokenId).unwrap_or(Option::None);
        require(token_owner.is_some(), InputError::TokenDoesNotExist);
        let token_owner = token_owner.unwrap();

        // Ensure that the sender is either:
        // 1. The owner of the token
        // 2. Approved for transfer of this `tokenId`
        // 3. Has operator approval for the `from` identity and this token belongs to the `from` identity
        let sender = msg_sender().unwrap();
        let approved = storage.approved.get(tokenId).unwrap_or(Option::None);
        require(sender == token_owner || (approved.is_some() && sender == approved.unwrap()) || (from == token_owner && storage.operator_approval.get((from, sender)).unwrap_or(false)), AccessError::SenderNotOwnerOrApproved);

        // Set the new owner of the token and reset the approved Identity
        storage.owners.insert(tokenId, Option::Some(to));
        if approved.is_some() {
            let update_identity: Option<Identity> = Option::None;
            storage.approved.insert(tokenId, update_identity);
        }

        storage.balances.insert(from, storage.balances.get(from).unwrap_or(0) - 1);
        storage.balances.insert(to, storage.balances.get(to).unwrap_or(0) + 1);

        log(Transfer {
            from,
            to,
            tokenId,
        });
    }

    #[storage(read, write)]
    fn transferFrom(from: Identity, to: Identity, tokenId: u64) {
        // Make sure the `tokenId` maps to an existing token
        let token_owner = storage.owners.get(tokenId).unwrap_or(Option::None);
        require(token_owner.is_some(), InputError::TokenDoesNotExist);
        let token_owner = token_owner.unwrap();

        // Ensure that the sender is either:
        // 1. The owner of the token
        // 2. Approved for transfer of this `tokenId`
        // 3. Has operator approval for the `from` identity and this token belongs to the `from` identity
        let sender = msg_sender().unwrap();
        let approved = storage.approved.get(tokenId).unwrap_or(Option::None);
        require(sender == token_owner || (approved.is_some() && sender == approved.unwrap()) || (from == token_owner && storage.operator_approval.get((from, sender)).unwrap_or(false)), AccessError::SenderNotOwnerOrApproved);

        // Set the new owner of the token and reset the approved Identity
        storage.owners.insert(tokenId, Option::Some(to));
        if approved.is_some() {
            let update_identity: Option<Identity> = Option::None;
            storage.approved.insert(tokenId, update_identity);
        }

        storage.balances.insert(from, storage.balances.get(from).unwrap_or(0) - 1);
        storage.balances.insert(to, storage.balances.get(to).unwrap_or(0) + 1);

        log(Transfer {
            from,
            to,
            tokenId,
        });
    }
}
