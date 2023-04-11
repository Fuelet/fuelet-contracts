import 'dart:js_util';

import 'package:flutter_fuelet_contracts/token_contract/token_initialize_config.dart';
import 'package:js/js_util.dart';

import 'base_token_contract.dart';
import 'js_interop/js_token_contract.dart' as js_token_contract;

class TokenContractImpl extends BaseTokenContract {
  late final String _nodeUrl;

  TokenContractImpl(String nodeUrl) {
    _nodeUrl = nodeUrl;
  }

  @override
  Future<TokenInitializeConfig> config(String contractId) async {
    final jsConfig = await promiseToFuture(
        js_token_contract.config(_enrichNetworkUrl(_nodeUrl), contractId));
    final configMap = _jsObjectToMap(jsConfig);
    return TokenInitializeConfig(
        configMap['name'], configMap['symbol'], configMap['decimals']);
  }

  Map<String, dynamic> _jsObjectToMap(Object o) {
    final dartObject = dartify(o) as Map;
    return dartObject.cast<String, dynamic>();
  }

  String _enrichNetworkUrl(String url) {
    String networkUrl = url;

    if (!url.contains('graphql')) {
      if (networkUrl[networkUrl.length - 1] == '/') {
        networkUrl += 'graphql';
      } else {
        networkUrl += '/graphql';
      }
    }

    return networkUrl;
  }
}
