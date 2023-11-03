import 'package:fuelet_contracts/fuelet_contracts.dart';

import '../../ffi/mobile_wrapper.dart';
import 'base_token_contract.dart';

class TokenContractImpl extends BaseTokenContract {
  static final FueletContracts _bridge = createLib();
  late final TokenContract _tokenContract;

  TokenContractImpl(String nodeUrl) {
    _tokenContract = TokenContract(bridge: _bridge, nodeUrl: nodeUrl);
  }

  @override
  Future<int> decimals(String contractId, String assetId) async {
    return await _tokenContract.decimals(
        contractId: contractId, assetId: assetId);
  }

  @override
  Future<String> name(String contractId, String assetId) async {
    return await _tokenContract.name(contractId: contractId, assetId: assetId);
  }

  @override
  Future<String> symbol(String contractId, String assetId) async {
    return await _tokenContract.symbol(
        contractId: contractId, assetId: assetId);
  }

  @override
  Future<int> totalAssets(String contractId) async {
    return await _tokenContract.totalAssets(contractId: contractId);
  }

  @override
  Future<int> totalSupply(String contractId, String assetId) async {
    return await _tokenContract.totalSupply(
        contractId: contractId, assetId: assetId);
  }
}
