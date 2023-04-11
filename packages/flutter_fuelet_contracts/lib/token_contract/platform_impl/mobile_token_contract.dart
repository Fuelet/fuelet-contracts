import 'package:flutter_fuelet_contracts/token_contract/token_initialize_config.dart';
import 'package:fuelet_contracts/fuelet_contracts.dart';

import 'base_token_contract.dart';

class TokenContractImpl extends BaseTokenContract {
  final FueletContracts _bridge = createLib();
  late final TokenContract _tokenContract;
  late final String _contractId;

  TokenContractImpl(String nodeUrl, String contractId) {
    _tokenContract = TokenContract(bridge: _bridge, nodeUrl: nodeUrl);
    _contractId = contractId;
  }

  @override
  Future<TokenInitializeConfig> config() async {
    final config = await _tokenContract.config(contractId: _contractId);
    return TokenInitializeConfig(config.name, config.symbol, config.decimals);
  }
}
