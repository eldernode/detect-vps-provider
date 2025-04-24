#!/bin/bash

# Detect VPS Provider Script - by Eldernode (v1.0)
# Description: Identify your VPS provider and check for possible resellers
# Requires: curl, dig, whois

# Colors for output
RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
BLUE="\e[34m"
NC="\e[0m" # No Color

# Step 1: Get public IP
IP=$(curl -s https://ipinfo.io/ip)
echo -e "${BLUE}✅ IP Address:${NC} $IP"

# Step 2: Get location and org from ipinfo
INFO=$(curl -s https://ipinfo.io/$IP)
CITY=$(echo "$INFO" | grep 'city' | cut -d '"' -f4)
REGION=$(echo "$INFO" | grep 'region' | cut -d '"' -f4)
COUNTRY=$(echo "$INFO" | grep 'country' | cut -d '"' -f4)
ORG=$(echo "$INFO" | grep 'org' | cut -d '"' -f4)

echo -e "${BLUE}🌍 Location:${NC} $CITY, $REGION, $COUNTRY"
echo -e "${BLUE}🏢 Organization:${NC} $ORG"

# Step 3: Reverse DNS check
RDNS=$(dig -x $IP +short)
if [ -z "$RDNS" ]; then
  RDNS="(No PTR Record)"
fi

echo -e "${BLUE}📡 Reverse DNS:${NC} $RDNS"

# Step 4: Heuristic check for reseller
if echo "$RDNS" | grep -iqE 'vps|your-server|cloud|host|reseller|clients'; then
  echo -e "${RED}⚠️ Status:${NC} Possible reseller or generic VPS hostname"
else
  echo -e "${GREEN}✔️ Status:${NC} Likely direct from provider"
fi

# Step 5: Recommendation
echo -e "\n${YELLOW}👉 Looking for verified VPS from real datacenter?${NC}"
echo -e "🔗 Visit: ${GREEN}https://eldernode.com/vps/${NC}\n"

exit 0
