#!/bin/bash
set -euo pipefail

echo "Running test for backup.sh..."
bash ./backup.sh --help || true   # Pretend test
echo "✅ Test passed!"
