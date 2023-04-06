// ignore_for_file: avoid_print

import 'dart:ffi';
import 'dart:io';

import 'package:fuelet_contracts/fuelet_contracts.dart';
import 'package:test/test.dart';

String projectPath = Directory.current.parent.parent.path;
final dynLib =
    DynamicLibrary.open('$projectPath/target/debug/libfuelet_contracts.dylib');
var rustSdk = createWrapper(dynLib);

const betaApiUrl = 'https://node-beta-2.fuel.network';

String ethAssetId =
    '0x0000000000000000000000000000000000000000000000000000000000000000';
String compoundAssetId =
    '0x13397cf760e15cd30194fa9d884cf4dd810c5d9e6459a4053e65f74f80b92f32';
String chainlinkAssetId =
    '0x71be783354a9bccfa9de0e7edf291797775e4a730d0922a9675258dbb47f557b';
String uniswapAssetId =
    '0x76c4fda9074c4509eaf2652f82bace86e2c7a21bf9faff7bf6228034ebc0f8a2';

void main() {
  test('get config from a token contract', () async {
    var tokenContract = await TokenContract.newTokenContract(
        bridge: rustSdk, nodeUrl: betaApiUrl);
    var response = await tokenContract.config(contractId: compoundAssetId);
    expect(response.name, 'Compound                        ');
    expect(response.symbol, 'COMP    ');
    expect(response.decimals, 9);
  });
}
