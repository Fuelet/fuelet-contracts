import 'base_send_coins_predicate.dart';

class SendCoinsPredicateImpl extends BaseSendCoinsPredicate {
  SendCoinsPredicateImpl(String nodeUrl, String codeHex);

  @override
  Future<String> address() {
    throw Exception('Stub implementation');
  }

  @override
  Future<String> transferTo(String receiver, int amount, String secret) {
    throw Exception('Stub implementation');
  }
}
