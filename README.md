![Logo](https://i.imgur.com/PyKLAe7.png)

[![License](https://img.shields.io/badge/license-The_Unlicense-red.svg)](https://unlicense.org/)

About
----

**IPsum** is a threat intelligence feed based on 30+ different publicly available [lists](https://github.com/stamparm/maltrail) of suspicious and/or malicious IP addresses. All lists are automatically retrieved and parsed on a daily (24h) basis and the final result is pushed to this repository. List is made of IP addresses together with a total number of (black)list occurrence (for each). Greater the number, lesser the chance of false positive detection and/or dropping in (inbound) monitored traffic. Also, list is sorted from most (problematic) to least occurent IP addresses.

As an example, to get a fresh and ready-to-deploy auto-ban list of "bad IPs" that appear on at least 3 (black)lists you can run:

```
curl --compressed https://raw.githubusercontent.com/stamparm/ipsum/master/ipsum.txt 2>/dev/null | grep -v "#" | grep -v -E "\s[1-2]$" | cut -f 1
```

If you want to try it with `ipset`, you can do the following:

```
sudo su
apt -qq install iptables ipset
ipset -q flush ipsum
ipset -q create ipsum hash:net
for ip in $(curl --compressed https://raw.githubusercontent.com/stamparm/ipsum/master/ipsum.txt 2>/dev/null | grep -v "#" | grep -v -E "\s[1-2]$" | cut -f 1); do ipset add ipsum $ip; done
iptables -I INPUT -m set --match-set ipsum src -j DROP
```

In directory [levels](levels) you can find preprocessed raw IP lists based on number of blacklist occurrences (e.g. [levels/3.txt](levels/3.txt) holds IP addresses that can be found on 3 or more blacklists).

Wall of Shame (2022-04-09)
----

|IP|DNS lookup|Number of (black)lists|
|---|---|--:|
45.67.34.253|-|9
89.234.157.254|marylou.nos-oignons.net|8
85.202.169.124|slot0.dslowry.com|8
116.105.212.31|-|8
171.25.193.77|tor-exit1-readme.dfri.se|8
171.25.193.78|tor-exit4-readme.dfri.se|8
185.220.101.4|berlin01.tor-exit.artikel10.org|8
178.20.55.18|marcuse-2.nos-oignons.net|8
144.172.73.66|tor|8
185.220.100.254|tor-exit-3.zbau.f3netze.de|8
179.43.154.138|-|8
179.43.168.126|-|8
130.162.183.218|-|8
171.25.193.25|tor-exit5-readme.dfri.se|8
37.0.11.224|-|8
80.67.172.162|algrothendieck.nos-oignons.net|8
194.165.16.5|-|8
185.129.62.62|tor01.zencurity.dk|8
163.123.142.166|-|8
45.67.34.100|-|8
61.177.173.37|-|8
61.177.173.36|-|8
61.177.173.35|-|8
80.82.77.139|dojo.census.shodan.io|7
128.31.0.13|tor-exit.csail.mit.edu|7
193.169.255.38|-|7
114.92.198.79|-|7
23.129.64.131|-|7
185.107.47.215|tor-exit.r1.ci.ax|7
164.92.220.20|-|7
185.220.101.1|berlin01.tor-exit.artikel10.org|7
23.129.64.215|-|7
144.217.86.109|vps-3d00216c.vps.ovh.ca|7
144.22.226.64|-|7
185.220.100.251|tor-exit-12.zbau.f3netze.de|7
185.220.100.253|tor-exit-2.zbau.f3netze.de|7
185.220.100.255|tor-exit-4.zbau.f3netze.de|7
199.249.230.87|tor38.quintex.com|7
195.254.135.76|-|7
116.62.13.32|-|7
185.220.101.24|berlin01.tor-exit.artikel10.org|7
192.42.116.13|this-is-a-tor-exit-node-hviv113.hviv.nl|7
176.113.115.82|-|7
116.105.216.128|-|7
141.98.11.29|sour.woinsta.com|7
185.220.102.4|communityexit.torservers.net|7
164.92.214.77|-|7
5.8.10.202|-|7
45.153.160.140|-|7
45.135.232.155|-|7
141.98.10.175|-|7
179.43.175.103|-|7
179.43.175.108|-|7
165.22.202.10|-|7
116.110.3.253|-|7
45.153.160.2|-|7
45.125.65.31|artdesigns.info|7
171.25.193.20|tor-exit0-readme.dfri.se|7
159.223.229.50|-|7
61.177.172.108|-|7
45.125.65.126|srv-45-125-65-126.serveroffer.net|7
61.177.172.124|-|7
23.129.64.149|-|7
23.129.64.147|-|7
62.102.148.69|-|7
104.244.76.13|tor-exit-node.spongebob.nicdex.com|7
45.153.160.133|-|7
45.153.160.130|-|7
45.153.160.135|-|7
61.177.172.98|-|7
64.225.70.8|-|7
185.220.101.12|berlin01.tor-exit.artikel10.org|7
114.241.52.59|-|7
64.113.32.29|tor.t-3.net|7
179.43.154.137|-|7
185.220.100.243|tor-exit-16.zbau.f3netze.de|7
192.42.116.16|tor-exit.hartvoorinternetvrijheid.nl|7
61.177.173.39|-|7
