import 'package:flutter_fuelet_contracts/token_contract/token_initialize_config.dart'
    as stub_send_money_predicate;

import 'base_send_coins_predicate.dart';

class SendCoinsPredicateImpl extends BaseSendCoinsPredicate {
  SendCoinsPredicateImpl(String nodeUrl, String codeHex);

  @override
  Future<String> address() {
    throw Exception('Stub implementation');
  }

  @override
  Future<void> transferTo(String receiver, int amount, String secret) {
    throw Exception('Stub implementation');
  }
}
