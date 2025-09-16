#!/bin/bash
set -euo pipefail

# Where backup.sh should put files
TEST_BACKUP_DIR="./test_backup"

# Clean up before running test
rm -rf "$TEST_BACKUP_DIR"

echo "🧪 Running real test for backup.sh..."

# Create a dummy file to back up
mkdir -p ./test_data
echo "hello world" > ./test_data/hello.txt

# Run your backup script (modify if it expects args)
bash ./backup.sh ./test_data "$TEST_BACKUP_DIR"

# Check if the backup folder was created
if [ ! -d "$TEST_BACKUP_DIR" ]; then
  echo "❌ Backup directory was not created!"
  exit 1
fi

# Check if the file was copied
if [ ! -f "$TEST_BACKUP_DIR/hello.txt" ]; then
  echo "❌ File was not backed up!"
  exit 1
fi

# Check file contents
if ! grep -q "hello world" "$TEST_BACKUP_DIR/hello.txt"; then
  echo "❌ File contents don’t match!"
  exit 1
fi

echo "✅ Backup test passed successfully!"
