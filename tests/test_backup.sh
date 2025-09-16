#!/bin/bash
set -euo pipefail

echo "🧪 Running backup.sh test..."

# --- Setup ---
TEST_DIR="./test_env"
TEST_DATA="$TEST_DIR/data"
TEST_BACKUP="$TEST_DIR/backups"
mkdir -p "$TEST_DATA" "$TEST_BACKUP"

# Create dummy config.conf
cat > "$TEST_DIR/config.conf" <<EOF
BACKUP_DIR="$TEST_BACKUP"
BACKUP_PATHS=("$TEST_DATA")
EOF

# Create dummy file to back up
echo "hello world" > "$TEST_DATA/hello.txt"

# --- Mock rclone ---
# Replace 'rclone' with echo so no real upload happens
PATH="./tests/mocks:\$PATH"

mkdir -p ./tests/mocks
cat > ./tests/mocks/rclone <<'EOF'
#!/bin/bash
echo "[MOCK] rclone copy $@"
EOF
chmod +x ./tests/mocks/rclone

# --- Run script ---
bash ./backup.sh "$TEST_DIR/config.conf"

# --- Assertions ---
# 1. Backup file exists
if [ ! -f "$TEST_BACKUP"/backup_*.tar.gz ]; then
    echo "❌ Backup file was not created!"
    exit 1
fi

# 2. Extract and check contents
TMP_EXTRACT="$TEST_DIR/extracted"
mkdir -p "$TMP_EXTRACT"
tar -xzf "$TEST_BACKUP"/backup_*.tar.gz -C "$TMP_EXTRACT"

if ! grep -q "hello world" "$TMP_EXTRACT/$TEST_DATA/hello.txt"; then
    echo "❌ Backup file contents are wrong!"
    exit 1
fi

echo "✅ Backup test passed successfully!"
