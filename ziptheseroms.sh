#!/usr/bin/env bash

# Usage:
#   ./zip-by-extension.sh dsk
#   ./zip-by-extension.sh dsk rom iso
#
# Creates:
#   Alien.dsk  -> Alien.zip
#
# Then moves successfully processed originals to:
#   .bak/

set -euo pipefail

BACKUP_DIR=".bak"

mkdir -p "$BACKUP_DIR"

if [ "$#" -eq 0 ]; then
    echo "Usage: $0 <extension> [extension...]"
    exit 1
fi

for ext in "$@"; do
    echo "Processing *.$ext files..."

    find . -maxdepth 1 -type f -name "*.$ext" -print0 |
    while IFS= read -r -d '' file; do

        base="${file%.$ext}"
        zipfile="${base}.zip"

        # Skip if zip already exists
        if [ -f "$zipfile" ]; then
            echo "Skipping existing: $zipfile"
            continue
        fi

        echo "Zipping: $file"

        if zip -j -q "$zipfile" "$file"; then
            echo "Success: $zipfile"

            mv -- "$file" "$BACKUP_DIR"/
	    echo "$file moved to $BACKUP_DIR"
        else
            echo "FAILED: $file"

            rm -f -- "$zipfile"
        fi
    done
done

echo "Done."
