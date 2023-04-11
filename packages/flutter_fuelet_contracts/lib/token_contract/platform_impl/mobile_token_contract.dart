import 'package:flutter_fuelet_contracts/token_contract/token_initialize_config.dart';
import 'package:fuelet_contracts/fuelet_contracts.dart';

import 'base_token_contract.dart';

class TokenContractImpl extends BaseTokenContract {
  final FueletContracts _bridge = createLib();
  late final TokenContract _tokenContract;

  TokenContractImpl(String nodeUrl) {
    _tokenContract = TokenContract(bridge: _bridge, nodeUrl: nodeUrl);
  }

  @override
  Future<TokenInitializeConfig> config(String contractId) async {
    final config = await _tokenContract.config(contractId: contractId);
    return TokenInitializeConfig(config.name, config.symbol, config.decimals);
  }
}
