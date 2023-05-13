import 'platform_impl/stub_send_coins_predicate.dart'
    if (dart.library.io) 'platform_impl/mobile_send_coins_predicate.dart'
    if (dart.library.html) 'platform_impl/web_send_coins_predicate.dart';

class SendCoinsPredicate {
  late final SendCoinsPredicateImpl _predicate;

  SendCoinsPredicate(String nodeUrl, String codeHex) {
    _predicate = SendCoinsPredicateImpl(nodeUrl, codeHex);
  }

  Future<String> address() {
    return _predicate.address();
  }

  Future<void> transferTo(String receiver, int amount, String secret) {
    return _predicate.transferTo(receiver, amount, secret);
  }
}
