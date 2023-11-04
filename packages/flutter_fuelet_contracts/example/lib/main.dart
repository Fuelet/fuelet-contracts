import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_fuelet_contracts/token_contract/token_contract.dart';

const _betaApiUrl = 'https://beta-4.fuel.network';

const _contractId =
    '0x047bec0207ccc6d7dc192a6e2b7497485c2f89e9dd5b06543f3cb2132ffd7360';
const _assetId =
    '0x792586f81f2727c479a4c80d3ab6a3953678348f12e74a7f710010db13ef3ddb';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TokenContract tokenContract = TokenContract(_betaApiUrl);
  int? _totalAssets;
  int? _totalSupply;
  String? _name;
  String? _symbol;
  int? _decimals;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(fontSize: 25);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fuelet contracts'),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16),
            alignment: Alignment.center,
            child: Column(
              children: [
                Text(
                  'totalAssets: ${_totalAssets ?? 'Undefined'}',
                  style: textStyle,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  'totalSupply: ${_totalSupply ?? 'Undefined'}',
                  style: textStyle,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  'name: ${_name ?? 'Undefined'}',
                  style: textStyle,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  'symbol: ${_symbol ?? 'Undefined'}',
                  style: textStyle,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  'decimals: ${_decimals ?? 'Undefined'}',
                  style: textStyle,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                OutlinedButton(
                  onPressed: _getConfig,
                  child: const Text('Retrieve config'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _getConfig() async {
    final totalAssets = await tokenContract.totalAssets(_contractId);
    final totalSupply = await tokenContract.totalSupply(_contractId, _assetId);
    final name = await tokenContract.name(_contractId, _assetId);
    final symbol = await tokenContract.symbol(_contractId, _assetId);
    final decimals = await tokenContract.decimals(_contractId, _assetId);
    setState(() {
      _totalAssets = totalAssets;
      _totalSupply = totalSupply;
      _name = name;
      _symbol = symbol;
      _decimals = decimals;
    });
  }
}
