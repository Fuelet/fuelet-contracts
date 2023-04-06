import 'dart:js_util';

import 'package:flutter_fuelet_contracts/token_contract/token_initialize_config.dart';
import 'package:js/js_util.dart';

import 'base_token_contract.dart';
import 'js_interop/js_token_contract.dart' as js_token_contract;

class TokenContractImpl extends BaseTokenContract {
  late final js_token_contract.TokenContract tokenContract;

  TokenContractImpl(String nodeUrl, String contractId) {
    tokenContract = js_token_contract.TokenContract(nodeUrl, contractId);
  }

  @override
  Future<TokenInitializeConfig> config() async {
    final jsConfig = await promiseToFuture(tokenContract.config());
    final configMap = _jsObjectToMap(jsConfig);
    return TokenInitializeConfig(
        configMap['name'], configMap['symbol'], configMap['decimals']);
  }

  Map<String, dynamic> _jsObjectToMap(Object o) {
    final dartObject = dartify(o) as Map;
    return dartObject.cast<String, dynamic>();
  }
}
