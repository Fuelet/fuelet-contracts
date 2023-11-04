import 'base_token_contract.dart';

class TokenContractImpl extends BaseTokenContract {
  TokenContractImpl(String nodeUrl);

  @override
  Future<int?> decimals(String contractId, String assetId) {
    throw Exception('Stub implementation');
  }

  @override
  Future<String?> name(String contractId, String assetId) {
    throw Exception('Stub implementation');
  }

  @override
  Future<String?> symbol(String contractId, String assetId) {
    throw Exception('Stub implementation');
  }

  @override
  Future<int> totalAssets(String contractId) {
    throw Exception('Stub implementation');
  }

  @override
  Future<int?> totalSupply(String contractId, String assetId) {
    throw Exception('Stub implementation');
  }
}
