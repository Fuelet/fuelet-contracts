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
}
