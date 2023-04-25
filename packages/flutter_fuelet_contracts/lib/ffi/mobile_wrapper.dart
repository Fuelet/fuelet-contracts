import 'dart:ffi';
import 'dart:io';

import 'package:fuelet_contracts/fuelet_contracts.dart';

typedef ExternalLibrary = DynamicLibrary;

DynamicLibrary Function() _appleDynLibFactory = DynamicLibrary.process;
FueletContracts? _wrapper;

/// Might be useful when used in combination with other ffi libraries to create
/// a singleton of DynamicLibrary for apple devices
void setAppleDynLibFactory(DynamicLibrary Function() factory) {
  _appleDynLibFactory = factory;
}

DynamicLibrary createLibraryImpl() {
  const base = 'fuelet_contracts';

  if (Platform.isIOS || Platform.isMacOS) {
    return _appleDynLibFactory();
  } else if (Platform.isWindows) {
    return DynamicLibrary.open('$base.dll');
  } else {
    return DynamicLibrary.open('lib$base.so');
  }
}

FueletContracts createWrapper(ExternalLibrary lib) {
  _wrapper ??= FueletContractsImpl(lib);
  return _wrapper!;
}

FueletContracts createLib() => createWrapper(createLibraryImpl());
