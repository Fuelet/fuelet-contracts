import '../token_initialize_config.dart';

abstract class BaseTokenContract {
  const BaseTokenContract();

  Future<TokenInitializeConfig> config();
}
