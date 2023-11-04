#!/bin/bash

set -e

cd packages/flutter_fuelet_contracts/web
npm exec -- fuels typegen -i ../../../contracts/token_contract/out/debug/token_contract-abi.json -o src/types
