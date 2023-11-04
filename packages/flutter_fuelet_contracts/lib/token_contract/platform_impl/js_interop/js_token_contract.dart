@JS('flutter_fuelet_token_contract')
library js_token_contract;

import 'package:js/js.dart';

@JS('total_assets')
external Object totalAssets(String nodeUrl, String contractId);

@JS('total_supply')
external Object totalSupply(String nodeUrl, String contractId, String assetId);

@JS('name')
external Object name(String nodeUrl, String contractId, String assetId);

@JS('symbol')
external Object symbol(String nodeUrl, String contractId, String assetId);

@JS('decimals')
external Object decimals(String nodeUrl, String contractId, String assetId);
