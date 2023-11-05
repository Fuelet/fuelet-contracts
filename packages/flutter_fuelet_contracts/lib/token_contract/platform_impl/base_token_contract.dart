import 'package:flutter_fuelet_contracts/model/metadata_value.dart';

abstract class BaseTokenContract {
  const BaseTokenContract();

  Future<int> totalAssets(String contractId);

  Future<int?> totalSupply(String contractId, String assetId);

  Future<String?> name(String contractId, String assetId);

  Future<String?> symbol(String contractId, String assetId);

  Future<int?> decimals(String contractId, String assetId);

  Future<MetadataValue?> metadata(String contractId, String assetId, String key);
}
