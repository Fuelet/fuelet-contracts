abstract class BaseSendCoinsPredicate {
  const BaseSendCoinsPredicate();

  Future<String> address();

  Future<String> transferTo(String receiver, int amount, String secret);
}
