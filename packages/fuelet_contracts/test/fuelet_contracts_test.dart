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

void main() {
  test('get config from a token contract', () async {
    var tokenContract = await TokenContract.newTokenContract(
        bridge: rustSdk, nodeUrl: betaApiUrl);
    var response = await tokenContract.config(contractId: swayTokenAssetId);
    expect(response.name, 'Sway token                      ');
    expect(response.symbol, 'SWAY    ');
    expect(response.decimals, 9);
  });
}
