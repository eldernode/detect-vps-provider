#!/bin/bash

# Detect VPS Provider Script
# Made with 💙 by Eldernode – https://eldernode.com

echo "🔍 Detecting your VPS environment..."

# Get public IP address
IP=$(curl -s https://ipinfo.io/ip)
INFO=$(curl -s https://ipinfo.io/$IP/json)

ORG=$(echo "$INFO" | grep '"org"' | cut -d '"' -f4)
CITY=$(echo "$INFO" | grep '"city"' | cut -d '"' -f4)
REGION=$(echo "$INFO" | grep '"region"' | cut -d '"' -f4)
COUNTRY=$(echo "$INFO" | grep '"country"' | cut -d '"' -f4)

# Detect virtualization type
VIRT=$(systemd-detect-virt)

# Output results
echo ""
echo "📡 Public IP: $IP"
echo "🏢 Hosting Provider: $ORG"
echo "🌍 Location: $CITY, $REGION, $COUNTRY"
echo "🖥️ Virtualization: $VIRT"
echo ""
echo "💡 Want better speed, uptime, and support?"
echo "👉 Try Eldernode VPS → https://eldernode.com"
echo ""
echo "----------------------------------------"
echo "🛠️  Script by Eldernode.com – Free to use"
echo "📤 Share it on GitHub, Twitter & Reddit!"
echo "----------------------------------------"
