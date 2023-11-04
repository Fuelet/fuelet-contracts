import 'dart:js_util';

import 'package:js/js_util.dart';

import 'base_token_contract.dart';
import 'js_interop/js_token_contract.dart' as js_token_contract;

class TokenContractImpl extends BaseTokenContract {
  late final String _nodeUrl;

  TokenContractImpl(String nodeUrl) {
    _nodeUrl = nodeUrl;
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

  @override
  Future<int?> decimals(String contractId, String assetId) async {
    return await promiseToFuture(js_token_contract.decimals(
        _enrichNetworkUrl(_nodeUrl), contractId, assetId));
  }

  @override
  Future<String?> name(String contractId, String assetId) async {
    return await promiseToFuture(js_token_contract.name(
        _enrichNetworkUrl(_nodeUrl), contractId, assetId));
  }

  @override
  Future<String?> symbol(String contractId, String assetId) async {
    return await promiseToFuture(js_token_contract.symbol(
        _enrichNetworkUrl(_nodeUrl), contractId, assetId));
  }

  @override
  Future<int> totalAssets(String contractId) async {
    return await promiseToFuture(
        js_token_contract.totalAssets(_enrichNetworkUrl(_nodeUrl), contractId));
  }

  @override
  Future<int?> totalSupply(String contractId, String assetId) async {
    return await promiseToFuture(js_token_contract.totalSupply(
        _enrichNetworkUrl(_nodeUrl), contractId, assetId));
  }
}
