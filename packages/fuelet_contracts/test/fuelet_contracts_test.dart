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

String nftContractId =
    '0x75515a0c909c692b7373f8d9a277366c43a5c97bad4dd8b482cac04144533bd8';
String nftAssetId =
    '0x3fd180f2ae2d0d32b110dae5a76b606430b9f934ba7510d4b33188fc8cd9f73e';

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
    var totalSupply = await tokenContract.totalSupply(
        contractId: contractId, assetId: assetId);

    expect(totalSupply, 1998);
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

  // TODO: doesn't work because of the SWAY restrictions: Enums currently support only one level deep heap types
  // test('get metadata from an NFT contract', () async {
  //   var tokenContract = await TokenContract.newTokenContract(
  //       bridge: rustSdk, nodeUrl: betaApiUrl);
  //   var nftTokenURI = await tokenContract.metadata(
  //       contractId: nftContractId, assetId: nftAssetId, key: 'tokenURI');
  //
  //   expect(nftTokenURI, "");
  // });
}
