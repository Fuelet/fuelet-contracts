abstract class BaseSendCoinsPredicate {
  const BaseSendCoinsPredicate();

  Future<String> address();

  Future<void> transferTo(String receiver, int amount, String secret);
}
