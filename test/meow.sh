#!/bin/bash

# Check if two arguments are provided
if [ $# -ne 2 ]; then
  echo "Usage: $0 <PID> <X>"
  exit 1
fi

# Assign arguments to variables
PID=$1
X=$2

# Validate if the PID is a number
if ! [[ "$PID" =~ ^[0-9]+$ ]]; then
  echo "Error: PID should be a valid number."
  exit 1
fi

# Validate if X is a positive integer
if ! [[ "$X" =~ ^[0-9]+$ ]] || [ "$X" -le 0 ]; then
  echo "Error: X should be a positive integer."
  exit 1
fi

# Run the client command X times
for ((i = 0; i < X; i++)); do
  ./client "$PID" "meow "
done

./client "$PID" ":3"

echo "meowed $X times."
