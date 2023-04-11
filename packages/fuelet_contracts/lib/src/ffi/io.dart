import 'dart:ffi';
import 'dart:io';

import 'package:fuelet_contracts/src/bridge_generated.dart';

typedef ExternalLibrary = DynamicLibrary;

FueletContracts createWrapperImpl(ExternalLibrary dylib) =>
    FueletContractsImpl(dylib);

DynamicLibrary createLibraryImpl() {
  const base = 'fuelet_contracts';

  if (Platform.isIOS || Platform.isMacOS) {
    return DynamicLibrary.process();
  } else if (Platform.isWindows) {
    return DynamicLibrary.open('$base.dll');
  } else {
    return DynamicLibrary.open('lib$base.so');
  }
}
