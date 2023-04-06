#!/bin/bash

set -e

fuels typegen -i contracts/token_contract/out/debug/token_contract-abi.json -o packages/flutter_fuelet_contracts/web/src/types --contract
