#!/bin/bash

set -e

npm --prefix packages/flutter_fuelet_contracts/web install
npm --prefix packages/flutter_fuelet_contracts/web run build
