#!/bin/bash

# Setup
BUILD_DIR=platform-build
mkdir $BUILD_DIR
cd $BUILD_DIR

# Build static libs
for TARGET in \
        aarch64-apple-ios x86_64-apple-ios aarch64-apple-ios-sim # \
        # x86_64-apple-darwin aarch64-apple-darwin
do
    rustup target add $TARGET
    cargo build -r --target=$TARGET
done

# Create XCFramework zip
FRAMEWORK="FlutterFueletContracts.xcframework"
LIBNAME=libfuelet_contracts.a
# mkdir mac-lipo ios-sim-lipo
mkdir ios-sim-lipo
IOS_SIM_LIPO=ios-sim-lipo/$LIBNAME
# MAC_LIPO=mac-lipo/$LIBNAME
lipo -create -output $IOS_SIM_LIPO \
        ../target/aarch64-apple-ios-sim/release/$LIBNAME \
        ../target/x86_64-apple-ios/release/$LIBNAME
# lipo -create -output $MAC_LIPO \
#         ../target/aarch64-apple-darwin/release/$LIBNAME \
#         ../target/x86_64-apple-darwin/release/$LIBNAME
xcodebuild -create-xcframework \
        -library $IOS_SIM_LIPO \
        -library ../target/aarch64-apple-ios/release/$LIBNAME \
        -output $FRAMEWORK
        # -library $MAC_LIPO \
zip -r $FRAMEWORK.zip $FRAMEWORK

# Cleanup
# rm -rf ios-sim-lipo mac-lipo $FRAMEWORK
rm -rf ios-sim-lipo $FRAMEWORK
cd ..

# Copy the binaries to the needed location
CURR_VERSION=fuelet_contracts-v`awk '/^version: /{print $2}' packages/fuelet_contracts/pubspec.yaml`

cp platform-build/FlutterFueletContracts.xcframework.zip packages/flutter_fuelet_contracts/ios/Frameworks/$CURR_VERSION.zip
echo "[ios] Copied file!"
