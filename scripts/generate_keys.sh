#!/bin/bash
set -e

# Generate node key
docker run --rm --cap-add=IPC_LOCK -v $(pwd)/keys:/keys ghcr.io/wormhole-foundation/guardiand:latest keygen --desc "Node key" /keys/node.key

# Generate guardian key
docker run --rm --cap-add=IPC_LOCK -v $(pwd)/keys:/keys ghcr.io/wormhole-foundation/guardiand:latest keygen --desc "Guardian key" /keys/guardian.key

# Generate wormchain key
docker run --rm --cap-add=IPC_LOCK -v $(pwd)/keys:/keys ghcr.io/wormhole-foundation/wormchaind:latest keys add wormchain --keyring-backend file --home /keys
docker run --rm --cap-add=IPC_LOCK -v $(pwd)/keys:/keys ghcr.io/wormhole-foundation/wormchaind:latest keys export wormchain --keyring-backend file --home /keys > /keys/wormchain.key
