import 'dart:ffi';
import 'dart:io';

import 'package:fuelet_contracts/fuelet_contracts.dart';

typedef ExternalLibrary = DynamicLibrary;

FueletContracts? _wrapper;
const _base = 'fuelet_contracts';
const _flutterLibName = 'flutter_$_base';

DynamicLibrary createLibraryImpl() {
  if (Platform.isIOS || Platform.isMacOS) {
    return DynamicLibrary.open('$_flutterLibName.framework/$_flutterLibName');
  } else if (Platform.isWindows) {
    return DynamicLibrary.open('$_base.dll');
  } else {
    return DynamicLibrary.open('lib$_base.so');
  }
}

FueletContracts createWrapper(ExternalLibrary lib) {
  _wrapper ??= FueletContractsImpl(lib);
  return _wrapper!;
}

FueletContracts createLib() => createWrapper(createLibraryImpl());
