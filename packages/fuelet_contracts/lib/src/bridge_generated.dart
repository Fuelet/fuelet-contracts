// AUTO GENERATED FILE, DO NOT EDIT.
// Generated by `flutter_rust_bridge`@ 1.75.3.
// ignore_for_file: non_constant_identifier_names, unused_element, duplicate_ignore, directives_ordering, curly_braces_in_flow_control_structures, unnecessary_lambdas, slash_for_doc_comments, prefer_const_literals_to_create_immutables, implicit_dynamic_list_literal, duplicate_import, unused_import, unnecessary_import, prefer_single_quotes, prefer_const_constructors, use_super_parameters, always_use_package_imports, annotate_overrides, invalid_use_of_protected_member, constant_identifier_names, invalid_use_of_internal_member, prefer_is_empty, unnecessary_const

import 'dart:convert';
import 'dart:async';
import 'package:meta/meta.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge.dart';
import 'package:uuid/uuid.dart';
import 'package:freezed_annotation/freezed_annotation.dart' hide protected;

import 'dart:ffi' as ffi;

part 'bridge_generated.freezed.dart';

abstract class FueletContracts {
  Future<TokenContract> newStaticMethodTokenContract(
      {required String nodeUrl, dynamic hint});

  FlutterRustBridgeTaskConstMeta get kNewStaticMethodTokenContractConstMeta;

  Future<int> totalAssetsMethodTokenContract(
      {required TokenContract that, required String contractId, dynamic hint});

  FlutterRustBridgeTaskConstMeta get kTotalAssetsMethodTokenContractConstMeta;

  Future<int?> totalSupplyMethodTokenContract(
      {required TokenContract that,
      required String contractId,
      required String assetId,
      dynamic hint});

  FlutterRustBridgeTaskConstMeta get kTotalSupplyMethodTokenContractConstMeta;

  Future<String?> nameMethodTokenContract(
      {required TokenContract that,
      required String contractId,
      required String assetId,
      dynamic hint});

  FlutterRustBridgeTaskConstMeta get kNameMethodTokenContractConstMeta;

  Future<String?> symbolMethodTokenContract(
      {required TokenContract that,
      required String contractId,
      required String assetId,
      dynamic hint});

  FlutterRustBridgeTaskConstMeta get kSymbolMethodTokenContractConstMeta;

  Future<int?> decimalsMethodTokenContract(
      {required TokenContract that,
      required String contractId,
      required String assetId,
      dynamic hint});

  FlutterRustBridgeTaskConstMeta get kDecimalsMethodTokenContractConstMeta;

  Future<Metadata?> metadataMethodTokenContract(
      {required TokenContract that,
      required String contractId,
      required String assetId,
      required String key,
      dynamic hint});

  FlutterRustBridgeTaskConstMeta get kMetadataMethodTokenContractConstMeta;
}

@freezed
class Metadata with _$Metadata {
  /// Used when the stored metadata is a `u64`.
  const factory Metadata.int(
    int field0,
  ) = Metadata_Int;

  /// Used when the stored metadata is a `String`.
  const factory Metadata.string(
    String field0,
  ) = Metadata_String;
}

class TokenContract {
  final FueletContracts bridge;
  final String nodeUrl;

  const TokenContract({
    required this.bridge,
    required this.nodeUrl,
  });

  static Future<TokenContract> newTokenContract(
          {required FueletContracts bridge,
          required String nodeUrl,
          dynamic hint}) =>
      bridge.newStaticMethodTokenContract(nodeUrl: nodeUrl, hint: hint);

  Future<int> totalAssets({required String contractId, dynamic hint}) =>
      bridge.totalAssetsMethodTokenContract(
        that: this,
        contractId: contractId,
      );

  Future<int?> totalSupply(
          {required String contractId,
          required String assetId,
          dynamic hint}) =>
      bridge.totalSupplyMethodTokenContract(
        that: this,
        contractId: contractId,
        assetId: assetId,
      );

  Future<String?> name(
          {required String contractId,
          required String assetId,
          dynamic hint}) =>
      bridge.nameMethodTokenContract(
        that: this,
        contractId: contractId,
        assetId: assetId,
      );

  Future<String?> symbol(
          {required String contractId,
          required String assetId,
          dynamic hint}) =>
      bridge.symbolMethodTokenContract(
        that: this,
        contractId: contractId,
        assetId: assetId,
      );

  Future<int?> decimals(
          {required String contractId,
          required String assetId,
          dynamic hint}) =>
      bridge.decimalsMethodTokenContract(
        that: this,
        contractId: contractId,
        assetId: assetId,
      );

  Future<Metadata?> metadata(
          {required String contractId,
          required String assetId,
          required String key,
          dynamic hint}) =>
      bridge.metadataMethodTokenContract(
        that: this,
        contractId: contractId,
        assetId: assetId,
        key: key,
      );
}

class FueletContractsImpl implements FueletContracts {
  final FueletContractsPlatform _platform;
  factory FueletContractsImpl(ExternalLibrary dylib) =>
      FueletContractsImpl.raw(FueletContractsPlatform(dylib));

  /// Only valid on web/WASM platforms.
  factory FueletContractsImpl.wasm(FutureOr<WasmModule> module) =>
      FueletContractsImpl(module as ExternalLibrary);
  FueletContractsImpl.raw(this._platform);
  Future<TokenContract> newStaticMethodTokenContract(
      {required String nodeUrl, dynamic hint}) {
    var arg0 = _platform.api2wire_String(nodeUrl);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) =>
          _platform.inner.wire_new__static_method__TokenContract(port_, arg0),
      parseSuccessData: (d) => _wire2api_token_contract(d),
      constMeta: kNewStaticMethodTokenContractConstMeta,
      argValues: [nodeUrl],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kNewStaticMethodTokenContractConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "new__static_method__TokenContract",
        argNames: ["nodeUrl"],
      );

  Future<int> totalAssetsMethodTokenContract(
      {required TokenContract that, required String contractId, dynamic hint}) {
    var arg0 = _platform.api2wire_box_autoadd_token_contract(that);
    var arg1 = _platform.api2wire_String(contractId);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner
          .wire_total_assets__method__TokenContract(port_, arg0, arg1),
      parseSuccessData: _wire2api_u64,
      constMeta: kTotalAssetsMethodTokenContractConstMeta,
      argValues: [that, contractId],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kTotalAssetsMethodTokenContractConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "total_assets__method__TokenContract",
        argNames: ["that", "contractId"],
      );

  Future<int?> totalSupplyMethodTokenContract(
      {required TokenContract that,
      required String contractId,
      required String assetId,
      dynamic hint}) {
    var arg0 = _platform.api2wire_box_autoadd_token_contract(that);
    var arg1 = _platform.api2wire_String(contractId);
    var arg2 = _platform.api2wire_String(assetId);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner
          .wire_total_supply__method__TokenContract(port_, arg0, arg1, arg2),
      parseSuccessData: _wire2api_opt_box_autoadd_u64,
      constMeta: kTotalSupplyMethodTokenContractConstMeta,
      argValues: [that, contractId, assetId],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kTotalSupplyMethodTokenContractConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "total_supply__method__TokenContract",
        argNames: ["that", "contractId", "assetId"],
      );

  Future<String?> nameMethodTokenContract(
      {required TokenContract that,
      required String contractId,
      required String assetId,
      dynamic hint}) {
    var arg0 = _platform.api2wire_box_autoadd_token_contract(that);
    var arg1 = _platform.api2wire_String(contractId);
    var arg2 = _platform.api2wire_String(assetId);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner
          .wire_name__method__TokenContract(port_, arg0, arg1, arg2),
      parseSuccessData: _wire2api_opt_String,
      constMeta: kNameMethodTokenContractConstMeta,
      argValues: [that, contractId, assetId],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kNameMethodTokenContractConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "name__method__TokenContract",
        argNames: ["that", "contractId", "assetId"],
      );

  Future<String?> symbolMethodTokenContract(
      {required TokenContract that,
      required String contractId,
      required String assetId,
      dynamic hint}) {
    var arg0 = _platform.api2wire_box_autoadd_token_contract(that);
    var arg1 = _platform.api2wire_String(contractId);
    var arg2 = _platform.api2wire_String(assetId);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner
          .wire_symbol__method__TokenContract(port_, arg0, arg1, arg2),
      parseSuccessData: _wire2api_opt_String,
      constMeta: kSymbolMethodTokenContractConstMeta,
      argValues: [that, contractId, assetId],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kSymbolMethodTokenContractConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "symbol__method__TokenContract",
        argNames: ["that", "contractId", "assetId"],
      );

  Future<int?> decimalsMethodTokenContract(
      {required TokenContract that,
      required String contractId,
      required String assetId,
      dynamic hint}) {
    var arg0 = _platform.api2wire_box_autoadd_token_contract(that);
    var arg1 = _platform.api2wire_String(contractId);
    var arg2 = _platform.api2wire_String(assetId);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner
          .wire_decimals__method__TokenContract(port_, arg0, arg1, arg2),
      parseSuccessData: _wire2api_opt_box_autoadd_u8,
      constMeta: kDecimalsMethodTokenContractConstMeta,
      argValues: [that, contractId, assetId],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kDecimalsMethodTokenContractConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "decimals__method__TokenContract",
        argNames: ["that", "contractId", "assetId"],
      );

  Future<Metadata?> metadataMethodTokenContract(
      {required TokenContract that,
      required String contractId,
      required String assetId,
      required String key,
      dynamic hint}) {
    var arg0 = _platform.api2wire_box_autoadd_token_contract(that);
    var arg1 = _platform.api2wire_String(contractId);
    var arg2 = _platform.api2wire_String(assetId);
    var arg3 = _platform.api2wire_String(key);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner
          .wire_metadata__method__TokenContract(port_, arg0, arg1, arg2, arg3),
      parseSuccessData: _wire2api_opt_box_autoadd_metadata,
      constMeta: kMetadataMethodTokenContractConstMeta,
      argValues: [that, contractId, assetId, key],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kMetadataMethodTokenContractConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "metadata__method__TokenContract",
        argNames: ["that", "contractId", "assetId", "key"],
      );

  void dispose() {
    _platform.dispose();
  }
// Section: wire2api

  String _wire2api_String(dynamic raw) {
    return raw as String;
  }

  Metadata _wire2api_box_autoadd_metadata(dynamic raw) {
    return _wire2api_metadata(raw);
  }

  int _wire2api_box_autoadd_u64(dynamic raw) {
    return _wire2api_u64(raw);
  }

  int _wire2api_box_autoadd_u8(dynamic raw) {
    return raw as int;
  }

  Metadata _wire2api_metadata(dynamic raw) {
    switch (raw[0]) {
      case 0:
        return Metadata_Int(
          _wire2api_u64(raw[1]),
        );
      case 1:
        return Metadata_String(
          _wire2api_String(raw[1]),
        );
      default:
        throw Exception("unreachable");
    }
  }

  String? _wire2api_opt_String(dynamic raw) {
    return raw == null ? null : _wire2api_String(raw);
  }

  Metadata? _wire2api_opt_box_autoadd_metadata(dynamic raw) {
    return raw == null ? null : _wire2api_box_autoadd_metadata(raw);
  }

  int? _wire2api_opt_box_autoadd_u64(dynamic raw) {
    return raw == null ? null : _wire2api_box_autoadd_u64(raw);
  }

  int? _wire2api_opt_box_autoadd_u8(dynamic raw) {
    return raw == null ? null : _wire2api_box_autoadd_u8(raw);
  }

  TokenContract _wire2api_token_contract(dynamic raw) {
    final arr = raw as List<dynamic>;
    if (arr.length != 1)
      throw Exception('unexpected arr length: expect 1 but see ${arr.length}');
    return TokenContract(
      bridge: this,
      nodeUrl: _wire2api_String(arr[0]),
    );
  }

  int _wire2api_u64(dynamic raw) {
    return castInt(raw);
  }

  int _wire2api_u8(dynamic raw) {
    return raw as int;
  }

  Uint8List _wire2api_uint_8_list(dynamic raw) {
    return raw as Uint8List;
  }
}

// Section: api2wire

@protected
int api2wire_u8(int raw) {
  return raw;
}

// Section: finalizer

class FueletContractsPlatform
    extends FlutterRustBridgeBase<FueletContractsWire> {
  FueletContractsPlatform(ffi.DynamicLibrary dylib)
      : super(FueletContractsWire(dylib));

// Section: api2wire

  @protected
  ffi.Pointer<wire_uint_8_list> api2wire_String(String raw) {
    return api2wire_uint_8_list(utf8.encoder.convert(raw));
  }

  @protected
  ffi.Pointer<wire_TokenContract> api2wire_box_autoadd_token_contract(
      TokenContract raw) {
    final ptr = inner.new_box_autoadd_token_contract_0();
    _api_fill_to_wire_token_contract(raw, ptr.ref);
    return ptr;
  }

  @protected
  ffi.Pointer<wire_uint_8_list> api2wire_uint_8_list(Uint8List raw) {
    final ans = inner.new_uint_8_list_0(raw.length);
    ans.ref.ptr.asTypedList(raw.length).setAll(0, raw);
    return ans;
  }
// Section: finalizer

// Section: api_fill_to_wire

  void _api_fill_to_wire_box_autoadd_token_contract(
      TokenContract apiObj, ffi.Pointer<wire_TokenContract> wireObj) {
    _api_fill_to_wire_token_contract(apiObj, wireObj.ref);
  }

  void _api_fill_to_wire_token_contract(
      TokenContract apiObj, wire_TokenContract wireObj) {
    wireObj.node_url = api2wire_String(apiObj.nodeUrl);
  }
}

// ignore_for_file: camel_case_types, non_constant_identifier_names, avoid_positional_boolean_parameters, annotate_overrides, constant_identifier_names

// AUTO GENERATED FILE, DO NOT EDIT.
//
// Generated by `package:ffigen`.
// ignore_for_file: type=lint

/// generated by flutter_rust_bridge
class FueletContractsWire implements FlutterRustBridgeWireBase {
  @internal
  late final dartApi = DartApiDl(init_frb_dart_api_dl);

  /// Holds the symbol lookup function.
  final ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName)
      _lookup;

  /// The symbols are looked up in [dynamicLibrary].
  FueletContractsWire(ffi.DynamicLibrary dynamicLibrary)
      : _lookup = dynamicLibrary.lookup;

  /// The symbols are looked up with [lookup].
  FueletContractsWire.fromLookup(
      ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName)
          lookup)
      : _lookup = lookup;

  void store_dart_post_cobject(
    DartPostCObjectFnType ptr,
  ) {
    return _store_dart_post_cobject(
      ptr,
    );
  }

  late final _store_dart_post_cobjectPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(DartPostCObjectFnType)>>(
          'store_dart_post_cobject');
  late final _store_dart_post_cobject = _store_dart_post_cobjectPtr
      .asFunction<void Function(DartPostCObjectFnType)>();

  Object get_dart_object(
    int ptr,
  ) {
    return _get_dart_object(
      ptr,
    );
  }

  late final _get_dart_objectPtr =
      _lookup<ffi.NativeFunction<ffi.Handle Function(ffi.UintPtr)>>(
          'get_dart_object');
  late final _get_dart_object =
      _get_dart_objectPtr.asFunction<Object Function(int)>();

  void drop_dart_object(
    int ptr,
  ) {
    return _drop_dart_object(
      ptr,
    );
  }

  late final _drop_dart_objectPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.UintPtr)>>(
          'drop_dart_object');
  late final _drop_dart_object =
      _drop_dart_objectPtr.asFunction<void Function(int)>();

  int new_dart_opaque(
    Object handle,
  ) {
    return _new_dart_opaque(
      handle,
    );
  }

  late final _new_dart_opaquePtr =
      _lookup<ffi.NativeFunction<ffi.UintPtr Function(ffi.Handle)>>(
          'new_dart_opaque');
  late final _new_dart_opaque =
      _new_dart_opaquePtr.asFunction<int Function(Object)>();

  int init_frb_dart_api_dl(
    ffi.Pointer<ffi.Void> obj,
  ) {
    return _init_frb_dart_api_dl(
      obj,
    );
  }

  late final _init_frb_dart_api_dlPtr =
      _lookup<ffi.NativeFunction<ffi.IntPtr Function(ffi.Pointer<ffi.Void>)>>(
          'init_frb_dart_api_dl');
  late final _init_frb_dart_api_dl = _init_frb_dart_api_dlPtr
      .asFunction<int Function(ffi.Pointer<ffi.Void>)>();

  void wire_new__static_method__TokenContract(
    int port_,
    ffi.Pointer<wire_uint_8_list> node_url,
  ) {
    return _wire_new__static_method__TokenContract(
      port_,
      node_url,
    );
  }

  late final _wire_new__static_method__TokenContractPtr = _lookup<
          ffi.NativeFunction<
              ffi.Void Function(ffi.Int64, ffi.Pointer<wire_uint_8_list>)>>(
      'wire_new__static_method__TokenContract');
  late final _wire_new__static_method__TokenContract =
      _wire_new__static_method__TokenContractPtr
          .asFunction<void Function(int, ffi.Pointer<wire_uint_8_list>)>();

  void wire_total_assets__method__TokenContract(
    int port_,
    ffi.Pointer<wire_TokenContract> that,
    ffi.Pointer<wire_uint_8_list> contract_id,
  ) {
    return _wire_total_assets__method__TokenContract(
      port_,
      that,
      contract_id,
    );
  }

  late final _wire_total_assets__method__TokenContractPtr = _lookup<
          ffi.NativeFunction<
              ffi.Void Function(ffi.Int64, ffi.Pointer<wire_TokenContract>,
                  ffi.Pointer<wire_uint_8_list>)>>(
      'wire_total_assets__method__TokenContract');
  late final _wire_total_assets__method__TokenContract =
      _wire_total_assets__method__TokenContractPtr.asFunction<
          void Function(int, ffi.Pointer<wire_TokenContract>,
              ffi.Pointer<wire_uint_8_list>)>();

  void wire_total_supply__method__TokenContract(
    int port_,
    ffi.Pointer<wire_TokenContract> that,
    ffi.Pointer<wire_uint_8_list> contract_id,
    ffi.Pointer<wire_uint_8_list> asset_id,
  ) {
    return _wire_total_supply__method__TokenContract(
      port_,
      that,
      contract_id,
      asset_id,
    );
  }

  late final _wire_total_supply__method__TokenContractPtr = _lookup<
          ffi.NativeFunction<
              ffi.Void Function(
                  ffi.Int64,
                  ffi.Pointer<wire_TokenContract>,
                  ffi.Pointer<wire_uint_8_list>,
                  ffi.Pointer<wire_uint_8_list>)>>(
      'wire_total_supply__method__TokenContract');
  late final _wire_total_supply__method__TokenContract =
      _wire_total_supply__method__TokenContractPtr.asFunction<
          void Function(int, ffi.Pointer<wire_TokenContract>,
              ffi.Pointer<wire_uint_8_list>, ffi.Pointer<wire_uint_8_list>)>();

  void wire_name__method__TokenContract(
    int port_,
    ffi.Pointer<wire_TokenContract> that,
    ffi.Pointer<wire_uint_8_list> contract_id,
    ffi.Pointer<wire_uint_8_list> asset_id,
  ) {
    return _wire_name__method__TokenContract(
      port_,
      that,
      contract_id,
      asset_id,
    );
  }

  late final _wire_name__method__TokenContractPtr = _lookup<
          ffi.NativeFunction<
              ffi.Void Function(
                  ffi.Int64,
                  ffi.Pointer<wire_TokenContract>,
                  ffi.Pointer<wire_uint_8_list>,
                  ffi.Pointer<wire_uint_8_list>)>>(
      'wire_name__method__TokenContract');
  late final _wire_name__method__TokenContract =
      _wire_name__method__TokenContractPtr.asFunction<
          void Function(int, ffi.Pointer<wire_TokenContract>,
              ffi.Pointer<wire_uint_8_list>, ffi.Pointer<wire_uint_8_list>)>();

  void wire_symbol__method__TokenContract(
    int port_,
    ffi.Pointer<wire_TokenContract> that,
    ffi.Pointer<wire_uint_8_list> contract_id,
    ffi.Pointer<wire_uint_8_list> asset_id,
  ) {
    return _wire_symbol__method__TokenContract(
      port_,
      that,
      contract_id,
      asset_id,
    );
  }

  late final _wire_symbol__method__TokenContractPtr = _lookup<
          ffi.NativeFunction<
              ffi.Void Function(
                  ffi.Int64,
                  ffi.Pointer<wire_TokenContract>,
                  ffi.Pointer<wire_uint_8_list>,
                  ffi.Pointer<wire_uint_8_list>)>>(
      'wire_symbol__method__TokenContract');
  late final _wire_symbol__method__TokenContract =
      _wire_symbol__method__TokenContractPtr.asFunction<
          void Function(int, ffi.Pointer<wire_TokenContract>,
              ffi.Pointer<wire_uint_8_list>, ffi.Pointer<wire_uint_8_list>)>();

  void wire_decimals__method__TokenContract(
    int port_,
    ffi.Pointer<wire_TokenContract> that,
    ffi.Pointer<wire_uint_8_list> contract_id,
    ffi.Pointer<wire_uint_8_list> asset_id,
  ) {
    return _wire_decimals__method__TokenContract(
      port_,
      that,
      contract_id,
      asset_id,
    );
  }

  late final _wire_decimals__method__TokenContractPtr = _lookup<
          ffi.NativeFunction<
              ffi.Void Function(
                  ffi.Int64,
                  ffi.Pointer<wire_TokenContract>,
                  ffi.Pointer<wire_uint_8_list>,
                  ffi.Pointer<wire_uint_8_list>)>>(
      'wire_decimals__method__TokenContract');
  late final _wire_decimals__method__TokenContract =
      _wire_decimals__method__TokenContractPtr.asFunction<
          void Function(int, ffi.Pointer<wire_TokenContract>,
              ffi.Pointer<wire_uint_8_list>, ffi.Pointer<wire_uint_8_list>)>();

  void wire_metadata__method__TokenContract(
    int port_,
    ffi.Pointer<wire_TokenContract> that,
    ffi.Pointer<wire_uint_8_list> contract_id,
    ffi.Pointer<wire_uint_8_list> asset_id,
    ffi.Pointer<wire_uint_8_list> key,
  ) {
    return _wire_metadata__method__TokenContract(
      port_,
      that,
      contract_id,
      asset_id,
      key,
    );
  }

  late final _wire_metadata__method__TokenContractPtr = _lookup<
          ffi.NativeFunction<
              ffi.Void Function(
                  ffi.Int64,
                  ffi.Pointer<wire_TokenContract>,
                  ffi.Pointer<wire_uint_8_list>,
                  ffi.Pointer<wire_uint_8_list>,
                  ffi.Pointer<wire_uint_8_list>)>>(
      'wire_metadata__method__TokenContract');
  late final _wire_metadata__method__TokenContract =
      _wire_metadata__method__TokenContractPtr.asFunction<
          void Function(
              int,
              ffi.Pointer<wire_TokenContract>,
              ffi.Pointer<wire_uint_8_list>,
              ffi.Pointer<wire_uint_8_list>,
              ffi.Pointer<wire_uint_8_list>)>();

  ffi.Pointer<wire_TokenContract> new_box_autoadd_token_contract_0() {
    return _new_box_autoadd_token_contract_0();
  }

  late final _new_box_autoadd_token_contract_0Ptr =
      _lookup<ffi.NativeFunction<ffi.Pointer<wire_TokenContract> Function()>>(
          'new_box_autoadd_token_contract_0');
  late final _new_box_autoadd_token_contract_0 =
      _new_box_autoadd_token_contract_0Ptr
          .asFunction<ffi.Pointer<wire_TokenContract> Function()>();

  ffi.Pointer<wire_uint_8_list> new_uint_8_list_0(
    int len,
  ) {
    return _new_uint_8_list_0(
      len,
    );
  }

  late final _new_uint_8_list_0Ptr = _lookup<
          ffi
          .NativeFunction<ffi.Pointer<wire_uint_8_list> Function(ffi.Int32)>>(
      'new_uint_8_list_0');
  late final _new_uint_8_list_0 = _new_uint_8_list_0Ptr
      .asFunction<ffi.Pointer<wire_uint_8_list> Function(int)>();

  void free_WireSyncReturn(
    WireSyncReturn ptr,
  ) {
    return _free_WireSyncReturn(
      ptr,
    );
  }

  late final _free_WireSyncReturnPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(WireSyncReturn)>>(
          'free_WireSyncReturn');
  late final _free_WireSyncReturn =
      _free_WireSyncReturnPtr.asFunction<void Function(WireSyncReturn)>();
}

class _Dart_Handle extends ffi.Opaque {}

class wire_uint_8_list extends ffi.Struct {
  external ffi.Pointer<ffi.Uint8> ptr;

  @ffi.Int32()
  external int len;
}

class wire_TokenContract extends ffi.Struct {
  external ffi.Pointer<wire_uint_8_list> node_url;
}

typedef DartPostCObjectFnType = ffi.Pointer<
    ffi.NativeFunction<
        ffi.Bool Function(DartPort port_id, ffi.Pointer<ffi.Void> message)>>;
typedef DartPort = ffi.Int64;
