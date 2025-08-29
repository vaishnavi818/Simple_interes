#!/usr/bin/env bash
# simple-interest.sh: Compute Simple Interest = (P * R * T) / 100

set -euo pipefail

if [[ $# -ne 3 ]]; then
  echo "Usage: $0 <principal P> <rate R%> <time T years>" >&2
  exit 1
fi

P="$1"
R="$2"
T="$3"

# Validate numeric inputs
re='^([0-9]+([.][0-9]+)?)$'
for v in "$P" "$R" "$T"; do
  if ! [[ "$v" =~ $re ]]; then
    echo "Error: all inputs must be numbers (got: $v)" >&2
    exit 2
  fi
done

SI=$(awk -v P="$P" -v R="$R" -v T="$T" 'BEGIN { printf "%.2f", (P*R*T)/100 }')
echo "$SI"
