import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_fuelet_contracts/token_contract/token_contract.dart';
import 'package:flutter_fuelet_contracts/token_contract/token_initialize_config.dart';

const _betaApiUrl = 'https://node-beta-2.fuel.network';
const _compoundContractId =
    '0x13397cf760e15cd30194fa9d884cf4dd810c5d9e6459a4053e65f74f80b92f32';

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
  TokenInitializeConfig? _tokenConfig = null;

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
                  'name: ${_tokenConfig?.name ?? 'Undefined'}',
                  style: textStyle,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  'symbol: ${_tokenConfig?.symbol ?? 'Undefined'}',
                  style: textStyle,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  'decimals: ${_tokenConfig?.decimals ?? 'Undefined'}',
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
    final config = await tokenContract.config(_compoundContractId);
    setState(() {
      _tokenConfig = config;
    });
  }
}
