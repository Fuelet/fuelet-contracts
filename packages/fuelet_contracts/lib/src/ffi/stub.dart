import 'package:fuelet_contracts/src/bridge_generated.dart';

/// Represents the external library for fuelet_contracts
///
/// Will be a DynamicLibrary for dart:io or WasmModule for dart:html
typedef ExternalLibrary = Object;

FueletContracts createWrapperImpl(ExternalLibrary lib) =>
    throw UnimplementedError();

Object createLibraryImpl() => throw UnimplementedError();
