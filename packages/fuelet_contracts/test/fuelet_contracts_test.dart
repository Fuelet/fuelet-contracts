// ignore_for_file: avoid_print

import 'dart:ffi';
import 'dart:io';

import 'package:fuelet_contracts/fuelet_contracts.dart';
import 'package:test/test.dart';

String projectPath = Directory.current.parent.parent.path;
final dynLib =
    DynamicLibrary.open('$projectPath/target/debug/libfuelet_contracts.dylib');
var rustSdk = createWrapper(dynLib);

void main() {
  test('test hello rust', () async {
    var response = await rustSdk.helloFromRust();
    expect(response, 'Hello from Rust');
  });
}
