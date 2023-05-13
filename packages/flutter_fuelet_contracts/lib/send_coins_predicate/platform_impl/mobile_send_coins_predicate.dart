import 'dart:typed_data';

import 'package:fuelet_contracts/fuelet_contracts.dart';
import 'package:hex/hex.dart';

import '../../ffi/mobile_wrapper.dart';
import 'base_send_coins_predicate.dart';

class SendCoinsPredicateImpl extends BaseSendCoinsPredicate {
  static final FueletContracts _bridge = createLib();
  late final SendCoinsPredicate _predicate;

  SendCoinsPredicateImpl(String nodeUrl, String codeHex) {
    var normalized = _normalizeHex(codeHex);
    var code = Uint8List.fromList(HEX.decode(normalized));
    _predicate =
        SendCoinsPredicate(bridge: _bridge, nodeUrl: nodeUrl, code: code);
  }

  @override
  Future<String> address() {
    return _predicate.address();
  }

  @override
  Future<void> transferTo(String receiver, int amount, String secret) {
    return _predicate.transferTo(to: receiver, secret: secret, amount: amount);
  }

  String _normalizeHex(String hexString) {
    if (hexString.startsWith('0x') || hexString.startsWith('0X')) {
      return hexString.substring(2);
    }
    return hexString;
  }
}
