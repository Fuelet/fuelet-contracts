@JS('flutter_fuelet_token_contract')
library js_fuels_wallet;

import 'dart:js';

import 'package:js/js.dart';

@JS()
class TokenContract {
  external TokenContract(String nodeUrl, String contractId);
  external JsObject config();
}
