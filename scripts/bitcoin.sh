#!/bin/bash

API_URL="https://api.binance.com/api/v3/ticker/price?symbol=BTCUSDT"

PRICE=$(curl -s "$API_URL" | jq -r '.price')

FORMATED_PRICE=$(printf "%.1f" "$PRICE")

echo "$FORMATED_PRICE\$"
