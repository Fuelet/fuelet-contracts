import 'platform_impl/stub_token_contract.dart'
    if (dart.library.io) 'platform_impl/mobile_token_contract.dart'
    if (dart.library.html) 'platform_impl/web_token_contract.dart';
import 'token_initialize_config.dart';

class TokenContract {
  late final TokenContractImpl _tokenContract;

  TokenContract(String nodeUrl) {
    _tokenContract = TokenContractImpl(nodeUrl);
  }

  Future<TokenInitializeConfig> config(String contractId) {
    return _tokenContract.config(contractId);
  }
}
