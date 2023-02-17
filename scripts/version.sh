#!/bin/bash

CURR_VERSION=fuelet_contracts-v`awk '/^version: /{print $2}' packages/fuelet_contracts/pubspec.yaml`

# iOS & macOS
APPLE_HEADER="release_tag_name = '$CURR_VERSION' # generated; do not edit"
sed -i.bak "1 s/.*/$APPLE_HEADER/" packages/flutter_fuelet_contracts/ios/flutter_fuelet_contracts.podspec
sed -i.bak "1 s/.*/$APPLE_HEADER/" packages/flutter_fuelet_contracts/macos/flutter_fuelet_contracts.podspec
rm packages/flutter_fuelet_contracts/macos/*.bak packages/flutter_fuelet_contracts/ios/*.bak

# CMake platforms (Linux, Windows, and Android)
CMAKE_HEADER="set(LibraryVersion \"$CURR_VERSION\") # generated; do not edit"
for CMAKE_PLATFORM in android linux windows
do
    sed -i.bak "1 s/.*/$CMAKE_HEADER/" packages/flutter_fuelet_contracts/$CMAKE_PLATFORM/CMakeLists.txt
    rm packages/flutter_fuelet_contracts/$CMAKE_PLATFORM/*.bak
done

git add packages/flutter_fuelet_contracts/
