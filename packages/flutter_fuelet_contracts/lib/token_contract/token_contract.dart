import 'package:flutter_fuelet_contracts/model/metadata_value.dart';

import 'platform_impl/stub_token_contract.dart'
    if (dart.library.io) 'platform_impl/mobile_token_contract.dart'
    if (dart.library.html) 'platform_impl/web_token_contract.dart';

class TokenContract {
  late final TokenContractImpl _tokenContract;

  TokenContract(String nodeUrl) {
    _tokenContract = TokenContractImpl(nodeUrl);
  }

  Future<int> totalAssets(String contractId) async {
    try {
      return await _tokenContract.totalAssets(contractId);
    } catch (_) {
      return 0;
    }
  }

  Future<int?> totalSupply(String contractId, String assetId) async {
    try {
      return await _tokenContract.totalSupply(contractId, assetId);
    } catch (_) {
      return null;
    }
  }

  Future<String?> name(String contractId, String assetId) async {
    try {
      return await _tokenContract.name(contractId, assetId);
    } catch (_) {
      return null;
    }
  }

  Future<String?> symbol(String contractId, String assetId) async {
    try {
      return await _tokenContract.symbol(contractId, assetId);
    } catch (_) {
      return null;
    }
  }

  Future<int?> decimals(String contractId, String assetId) async {
    try {
      return await _tokenContract.decimals(contractId, assetId);
    } catch (_) {
      return null;
    }
  }

  Future<MetadataValue?> metadata(
      String contractId, String assetId, String key) async {
    if (key == "name") {
      return StringMetadataValue("lvl 1, I'm on board");
    }
    if (key == "image") {
      return StringMetadataValue(
          "https://fuelet-nft-rewards.s3.amazonaws.com/assets/image/Week+1.png");
    }
    if (key == "description") {
      return StringMetadataValue(
          "Starting your journey is often challenging, however, it's known to set the foundation for success. The first steps identify the paths ahead and equip you with essential tools and skills for the road. Exploring Fuel network starts from creating an account on Fuelet.\n\nYour adventure is just getting started, and there's so much more to uncover... Wish you luck! 💫");
    }
    return null;
  }
}
