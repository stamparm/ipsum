#!/bin/bash
#
# Run this daily using cron.
# Will update nftables with the 3-top list
# Make sure you have the following on your nftables.conf:
# ...
# table ip filter {
#   ...
#       
#       chain INPUT {
#             ....
#             jump ipsum-chain
#             ....
#       }
#     
#       set ipsum-chain {
#          type ipv4_addr
#          flags timeout
#       }
#       
#       chain ipsum-chaim {
#          ip saddr @ipsum-blacklist drop
#       }
#

rm -rf /tmp/bad-ips.txt

curl https://raw.githubusercontent.com/stamparm/ipsum/master/ipsum.txt 2>/dev/null | grep -v "#" | grep -v -E "\s[1-2]$" | cut -f 1 > /tmp/bad-ips.txt

# flush the set...

nft flush set ip filter ipsum-blacklist

# Build a config file with the set
echo "add element ip filter ipsum-blacklist { " > /tmp/nftables-ipsum
head -1 /tmp/bad-ips.txt >> /tmp/nftables-ipsum
tail -n +2 /tmp/bad-ips.txt | sed 's/^[\d\.]*/,/g' >> /tmp/nftables-ipsum
echo "}" >> /tmp/nftables-ipsum

# Load the set
nft -f /tmp/nftables-ipsum
