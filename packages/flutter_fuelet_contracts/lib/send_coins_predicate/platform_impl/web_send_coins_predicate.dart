import 'base_send_coins_predicate.dart';

class SendCoinsPredicateImpl extends BaseSendCoinsPredicate {
  SendCoinsPredicateImpl(String nodeUrl, String codeHex);

  @override
  Future<String> address() {
    throw Exception('Not implemented');
  }

  @override
  Future<void> transferTo(String receiver, int amount, String secret) {
    throw Exception('Not implemented');
  }
}
