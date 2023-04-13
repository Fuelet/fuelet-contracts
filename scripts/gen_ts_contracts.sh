#!/bin/bash

set -e

# beta-3
fuels typegen -i contracts/token_contract/out/debug/token_contract-abi.json -o packages/flutter_fuelet_contracts/web/src/types --contract

# beta-2
#fuelchain --target=fuels --out-dir=packages/flutter_fuelet_contracts/web/src/types contracts/token_contract/out/debug/token_contract-abi.json
