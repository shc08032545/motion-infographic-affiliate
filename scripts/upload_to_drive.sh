#!/usr/bin/env bash
set -euo pipefail

# Default Google Drive Output Folder:
# My Drive / 04_AI_โปรเจกต์และโน้ต / โปรเจกต์และเอกสาร_AI / motion-infographic-affiliate
DRIVE_ROOT_FOLDER_ID="${DRIVE_OUTPUT_FOLDER_ID:-1DaX-ltIh5DHTt-qGrK3rRZxmdz-M5nXW}"

if [[ $# -lt 2 ]]; then
  echo "Usage: $0 <subfolder_name> <local_file_or_dir>" >&2
  exit 1
fi

SUBFOLDER_NAME="$1"
SOURCE_PATH="$2"

if [[ ! -e "$SOURCE_PATH" ]]; then
  echo "Error: source path not found: $SOURCE_PATH" >&2
  exit 1
fi

echo "Creating Google Drive subfolder '${SUBFOLDER_NAME}' under ${DRIVE_ROOT_FOLDER_ID}..."
MKDIR_OUT="$(gdrive mutate mkdir "$SUBFOLDER_NAME" --parent "$DRIVE_ROOT_FOLDER_ID")"
echo "$MKDIR_OUT"

TARGET_FOLDER_ID="$(echo "$MKDIR_OUT" | sed -n 's/.*(ID: \([^)]*\)).*/\1/p' | head -n 1)"
if [[ -z "$TARGET_FOLDER_ID" ]]; then
  echo "Warning: could not parse subfolder ID, uploading to root output folder." >&2
  TARGET_FOLDER_ID="$DRIVE_ROOT_FOLDER_ID"
fi

if [[ -d "$SOURCE_PATH" ]]; then
  while IFS= read -r -d '' file; do
    echo "Uploading: $(basename "$file")"
    gdrive mutate upload "$file" --parent "$TARGET_FOLDER_ID"
  done < <(find "$SOURCE_PATH" -maxdepth 1 -type f ! -name '.gitkeep' -print0)
else
  echo "Uploading: $(basename "$SOURCE_PATH")"
  gdrive mutate upload "$SOURCE_PATH" --parent "$TARGET_FOLDER_ID"
fi

echo "Done! Google Drive folder: https://drive.google.com/drive/folders/${TARGET_FOLDER_ID}"
