#!/bin/bash
set -e

docker run --rm -v $(pwd)/configs/wormchain:/wormchain ghcr.io/wormhole-foundation/guardiand:latest wormchaind init mynode --chain-id wormchain --home /wormchain
