import 'package:fuelet_contracts/fuelet_contracts.dart';
import 'ffi/stub.dart'
    if (dart.library.io) 'ffi/io.dart'
    if (dart.library.html) 'ffi/web.dart';

FueletContracts? _wrapper;

FueletContracts createWrapper(ExternalLibrary lib) {
  _wrapper ??= createWrapperImpl(lib);
  return _wrapper!;
}

FueletContracts createLib() => createWrapper(createLibraryImpl());
