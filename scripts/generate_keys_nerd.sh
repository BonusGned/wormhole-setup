#!/bin/bash
set -e

# Generate node key
nerdctl run --rm --cap-add=IPC_LOCK -v $(pwd)/keys:/keys ghcr.io/wormhole-foundation/guardiand:latest keygen --desc "Node key" /keys/node.key

# Generate guardian key
nerdctl run --rm --cap-add=IPC_LOCK -v $(pwd)/keys:/keys ghcr.io/wormhole-foundation/guardiand:latest keygen --desc "Guardian key" /keys/guardian.key

# # Generate wormchain key
# nerdctl run --rm --cap-add=IPC_LOCK -v $(pwd)/keys:/keys wormhole-testnet-wormchain:latest keys add wormchain --keyring-backend file --home /keys
# nerdctl run --rm --cap-add=IPC_LOCK -v $(pwd)/keys:/keys wormhole-testnet-wormchain:latest keys export wormchain --keyring-backend file --home /keys > /keys/wormchain.key
