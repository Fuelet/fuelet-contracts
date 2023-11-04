import 'platform_impl/stub_token_contract.dart'
    if (dart.library.io) 'platform_impl/mobile_token_contract.dart'
    if (dart.library.html) 'platform_impl/web_token_contract.dart';

class TokenContract {
  late final TokenContractImpl _tokenContract;

  TokenContract(String nodeUrl) {
    _tokenContract = TokenContractImpl(nodeUrl);
  }

  Future<int> totalAssets(String contractId) {
    return _tokenContract.totalAssets(contractId);
  }

  Future<int> totalSupply(String contractId, String assetId) {
    return _tokenContract.totalSupply(contractId, assetId);
  }

  Future<String> name(String contractId, String assetId) {
    return _tokenContract.name(contractId, assetId);
  }

  Future<String> symbol(String contractId, String assetId) {
    return _tokenContract.symbol(contractId, assetId);
  }

  Future<int> decimals(String contractId, String assetId) {
    return _tokenContract.decimals(contractId, assetId);
  }
}
