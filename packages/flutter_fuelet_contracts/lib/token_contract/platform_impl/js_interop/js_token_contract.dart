@JS('flutter_fuelet_token_contract')
library js_token_contract;

import 'package:js/js.dart';

@JS('total_assets')
external int totalAssets(String nodeUrl, String contractId);

@JS('total_supply')
external int totalSupply(String nodeUrl, String contractId, String assetId);

@JS('total_supply')
external String name(String nodeUrl, String contractId, String assetId);

@JS('symbol')
external String symbol(String nodeUrl, String contractId, String assetId);

@JS('decimals')
external int decimals(String nodeUrl, String contractId, String assetId);
