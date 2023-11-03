// ignore_for_file: avoid_print

import 'dart:ffi';
import 'dart:io';

import 'package:fuelet_contracts/fuelet_contracts.dart';
import 'package:test/test.dart';

String projectPath = Directory.current.parent.parent.path;
final dynLib =
    DynamicLibrary.open('$projectPath/target/debug/libfuelet_contracts.dylib');
var rustSdk = FueletContractsImpl(dynLib);

const betaApiUrl = 'https://beta-4.fuel.network';

String contractId =
    '0x047bec0207ccc6d7dc192a6e2b7497485c2f89e9dd5b06543f3cb2132ffd7360';
String assetId =
    '0x792586f81f2727c479a4c80d3ab6a3953678348f12e74a7f710010db13ef3ddb';

void main() {
  test('get total assets from a token contract', () async {
    var tokenContract = await TokenContract.newTokenContract(
        bridge: rustSdk, nodeUrl: betaApiUrl);
    var totalAssets = await tokenContract.totalAssets(contractId: contractId);
    expect(totalAssets, 1);
  });

  test('get total_supply from a token contract', () async {
    var tokenContract = await TokenContract.newTokenContract(
        bridge: rustSdk, nodeUrl: betaApiUrl);
    var total_supply = await tokenContract.totalSupply(
        contractId: contractId, assetId: assetId);

    expect(total_supply, 1998);
  });

  test('get asset name from a token contract', () async {
    var tokenContract = await TokenContract.newTokenContract(
        bridge: rustSdk, nodeUrl: betaApiUrl);
    var name =
        await tokenContract.name(contractId: contractId, assetId: assetId);

    expect(name, 'Fueletoin');
  });

  test('get symbol from a token contract', () async {
    var tokenContract = await TokenContract.newTokenContract(
        bridge: rustSdk, nodeUrl: betaApiUrl);
    var symbol =
        await tokenContract.symbol(contractId: contractId, assetId: assetId);

    expect(symbol, 'FLTN');
  });

  test('get decimals from a token contract', () async {
    var tokenContract = await TokenContract.newTokenContract(
        bridge: rustSdk, nodeUrl: betaApiUrl);
    var decimals =
        await tokenContract.decimals(contractId: contractId, assetId: assetId);

    expect(decimals, 9);
  });
}
