![Logo](https://i.imgur.com/PyKLAe7.png)

[![License](https://img.shields.io/badge/license-The_Unlicense-red.svg)](https://unlicense.org/)

About
----

**IPsum** is a threat intelligence feed based on 30+ different publicly available [lists](https://github.com/stamparm/maltrail) of suspicious and/or malicious IP addresses. All lists are automatically retrieved and parsed on a daily (24h) basis and the final result is pushed to this repository. List is made of IP addresses together with a total number of (black)list occurrence (for each). Greater the number, lesser the chance of false positive detection and/or dropping in (inbound) monitored traffic. Also, list is sorted from most (problematic) to least occurent IP addresses.

As an example, to get a fresh and ready-to-deploy auto-ban list of "bad IPs" that appear on at least 3 (black)lists you can run:

```
curl https://raw.githubusercontent.com/stamparm/ipsum/master/ipsum.txt 2>/dev/null | grep -v "#" | grep -v -E "\s[1-2]$" | cut -f 1
```

If you want to try it with `ipset`, you can do the following:

```
sudo su
apt-get -qq install iptables ipset
ipset -q flush ipsum
ipset -q create ipsum hash:ip
for ip in $(curl https://raw.githubusercontent.com/stamparm/ipsum/master/ipsum.txt 2>/dev/null | grep -v "#" | grep -v -E "\s[1-2]$" | cut -f 1); do ipset add ipsum $ip; done
iptables -D INPUT -m set --match-set ipsum src -j DROP 2>/dev/null
iptables -I INPUT -m set --match-set ipsum src -j DROP
```

In directory [levels](levels) you can find preprocessed raw IP lists based on number of blacklist occurrences (e.g. [levels/3.txt](levels/3.txt) holds IP addresses that can be found on 3 or more blacklists).

Wall of Shame (2025-06-01)
----

|IP|DNS lookup|Number of (black)lists|
|---|---|--:|
185.93.89.118|-|9
193.32.162.157|-|9
142.93.13.29|-|9
3.137.73.221|scan.cypex.ai|8
92.118.39.65|-|8
193.32.162.89|-|8
154.92.111.94|-|8
45.148.10.67|-|7
80.82.70.133|rnd.group-ib.com|7
92.118.39.68|-|7
92.118.39.97|-|7
167.94.146.55|-|7
103.237.144.204|-|7
185.165.191.27|red.census.shodan.io|7
193.32.162.84|-|7
193.32.162.97|-|7
198.199.71.30|-|7
41.231.37.153|-|7
80.82.77.202|rnd.group-ib.com|7
94.159.102.167|-|7
103.39.93.93|-|7
107.173.37.111|107-173-37-111-host.colocrossing.com|7
180.178.94.73|-|7
42.114.170.3|-|7
