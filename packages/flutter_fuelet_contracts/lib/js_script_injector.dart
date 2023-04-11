@JS()
library fuel_wallet;

import 'dart:html';

import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:js/js.dart';

class JsScriptInjector {
  static void registerWith(Registrar registrar) {
    _loadScript(
        'assets/packages/flutter_fuelet_contracts/js/token_contract.js');
  }

  static void _loadScript(String path) {
    // Create a new script element
    ScriptElement script = ScriptElement();
    script.type = 'text/javascript';
    script.src = path;

    // Add the script element to the document's head
    document.head!.append(script);
  }
}
