#!/usr/bin/env bash

# Usage: ./increment.sh path/to/file.txt

FILE="$1"

# Check that a file was provided
if [[ -z "$FILE" ]]; then
  echo "Usage: $0 <file>"
  exit 1
fi

# Check that the file exists
if [[ ! -f "$FILE" ]]; then
  echo "Error: File does not exist: $FILE"
  exit 1
fi

# Read the integer
VALUE=$(<"$FILE")

# Validate that it's an integer
if ! [[ "$VALUE" =~ ^-?[0-9]+$ ]]; then
  echo "Error: File does not contain a valid integer"
  exit 1
fi

# If value is greater than 1000, exit with a fixed custom code
if (( VALUE > 999 )); then
  exit 0
fi

# Increment and save back to the same file
echo $((VALUE + 1)) > "$FILE"
exit 177
