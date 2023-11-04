abstract class BaseTokenContract {
  const BaseTokenContract();

  Future<int> totalAssets(String contractId);

  Future<int?> totalSupply(String contractId, String assetId);

  Future<String?> name(String contractId, String assetId);

  Future<String?> symbol(String contractId, String assetId);

  Future<int?> decimals(String contractId, String assetId);
}
