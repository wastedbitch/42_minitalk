#!/bin/bash

# Check if two arguments are provided
if [ $# -ne 1 ]; then
  echo "Usage: $0 <PID> <X>"
  exit 1
fi

# Assign arguments to variables
PID=$1

# Validate if the PID is a number
if ! [[ "$PID" =~ ^[0-9]+$ ]]; then
  echo "Error: PID should be a valid number."
  exit 1
fi

EMO="😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟 😼 🐟

"

./client "$PID" "$EMO"