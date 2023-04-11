@JS('flutter_fuelet_token_contract')
library js_token_contract;

import 'package:js/js.dart';

@JS('config')
external dynamic config(String nodeUrl, String contractId);
