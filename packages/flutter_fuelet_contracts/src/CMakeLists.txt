# The Flutter tooling requires that developers have CMake 3.10 or later
# installed. You should not increase this version, as doing so will cause
# the plugin to fail to compile for some customers of the plugin.
cmake_minimum_required(VERSION 3.10)

project(flutter_fuelet_contracts_library VERSION 0.0.1 LANGUAGES C)

add_library(flutter_fuelet_contracts SHARED
  "flutter_fuelet_contracts.c"
)

set_target_properties(flutter_fuelet_contracts PROPERTIES
  PUBLIC_HEADER flutter_fuelet_contracts.h
  OUTPUT_NAME "flutter_fuelet_contracts"
)

target_compile_definitions(flutter_fuelet_contracts PUBLIC DART_SHARED_LIB)
