// ignore_for_file: avoid_print

import 'dart:ffi';
import 'dart:io';

import 'package:fuelet_contracts/fuelet_contracts.dart';
import 'package:test/test.dart';

String projectPath = Directory.current.parent.parent.path;
final dynLib =
    DynamicLibrary.open('$projectPath/target/debug/libfuelet_contracts.dylib');
var rustSdk = FueletContractsImpl(dynLib);

const betaApiUrl = 'https://beta-3.fuel.network';

String swayTokenAssetId =
    '0x89eac25d412c5c1b63d212deacc109dcff804eff70101fe0fc72167bc7884aa2';
String predicateSecret =
    '2ee0702d32bade831ecf5ebf6707db9452a1be9d508f2fce9d0e4b3b4be751bd';
String predicateBytecode =
    '900000044700000000000000000000785dfcc00110fff30071480003614521017344000b614d210d9000001272400002134114005a41000173400011614d211f90000012240000001a485000910000405d47f004104513007240002028493400504d202072400020284d140050400020294124d0244000002ee0702d32bade831ecf5ebf6707db9452a1be9d508f2fce9d0e4b3b4be751bd0000000000000078';
String receiver =
    'fuel1h68gth3dvlhzd9v0p6wx0ee7uwvhnyxn4zhtcstz6amtmlyu3cvsn8eytp';

void main() {
  test('get config from a token contract', () async {
    var tokenContract = await TokenContract.newTokenContract(
        bridge: rustSdk, nodeUrl: betaApiUrl);
    var response = await tokenContract.config(contractId: swayTokenAssetId);
    expect(response.name, 'Sway token                      ');
    expect(response.symbol, 'SWAY    ');
    expect(response.decimals, 9);
  });

  test('get address from a predicate', () async {
    var pred = await SendCoinsPredicate.newSendCoinsPredicate(
        bridge: rustSdk, nodeUrl: betaApiUrl, codeHex: predicateBytecode);
    var address = await pred.address();
    expect(address,
        'fuel187jk4l6utnqnunwf23suge9v44d4gdn80q5ygw8xn3jpezdngcas5zyh6v');
  });

  test('transfer coins from predicate', () async {
    var pred = await SendCoinsPredicate.newSendCoinsPredicate(
        bridge: rustSdk, nodeUrl: betaApiUrl, codeHex: predicateBytecode);
    var txId = await pred.transferTo(to: receiver, secret: predicateSecret, amount: 100);
    print(txId);
  });
}
