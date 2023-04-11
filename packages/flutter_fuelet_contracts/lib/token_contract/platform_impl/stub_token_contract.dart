import 'package:flutter_fuelet_contracts/token_contract/token_initialize_config.dart';

import 'base_token_contract.dart';

class TokenContractImpl extends BaseTokenContract {
  TokenContractImpl(String nodeUrl);

  @override
  Future<TokenInitializeConfig> config(String contractId) {
    throw Exception('Stub implementation');
  }
}
