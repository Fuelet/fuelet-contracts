import 'platform_impl/stub_token_contract.dart'
    if (dart.library.io) 'platform_impl/mobile_token_contract.dart'
    if (dart.library.html) 'platform_impl/web_token_contract.dart';
import 'token_initialize_config.dart';

class TokenContract {
  late final TokenContractImpl _tokenContract;

  TokenContract(String nodeUrl, String contractId) {
    _tokenContract = TokenContractImpl(nodeUrl, contractId);
  }

  Future<TokenInitializeConfig> config() {
    return _tokenContract.config();
  }
}
