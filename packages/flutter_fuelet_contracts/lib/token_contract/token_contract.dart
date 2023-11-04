import 'platform_impl/stub_token_contract.dart'
    if (dart.library.io) 'platform_impl/mobile_token_contract.dart'
    if (dart.library.html) 'platform_impl/web_token_contract.dart';

class TokenContract {
  late final TokenContractImpl _tokenContract;

  TokenContract(String nodeUrl) {
    _tokenContract = TokenContractImpl(nodeUrl);
  }

  Future<int> totalAssets(String contractId) {
    try {
      return _tokenContract.totalAssets(contractId);
    } catch (_) {
      return Future.value(0);
    }
  }

  Future<int?> totalSupply(String contractId, String assetId) {
    try {
      return _tokenContract.totalSupply(contractId, assetId);
    } catch (_) {
      return Future.value(null);
    }
  }

  Future<String?> name(String contractId, String assetId) {
    try {
      return _tokenContract.name(contractId, assetId);
    } catch (_) {
      return Future.value(null);
    }
  }

  Future<String?> symbol(String contractId, String assetId) {
    try {
      return _tokenContract.symbol(contractId, assetId);
    } catch (_) {
      return Future.value(null);
    }
  }

  Future<int?> decimals(String contractId, String assetId) {
    try {
      return _tokenContract.decimals(contractId, assetId);
    } catch (_) {
      return Future.value(null);
    }
  }
}
