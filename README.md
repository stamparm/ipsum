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

Wall of Shame (2025-04-19)
----

|IP|DNS lookup|Number of (black)lists|
|---|---|--:|
218.92.0.218|-|10
218.92.0.220|-|10
218.92.0.226|-|10
218.92.0.228|-|10
134.209.120.69|-|9
218.92.0.111|-|9
218.92.0.216|-|9
218.92.0.217|-|9
218.92.0.219|-|9
218.92.0.221|-|9
218.92.0.223|-|9
218.92.0.225|-|9
218.92.0.227|-|9
218.92.0.229|-|9
218.92.0.230|-|9
218.92.0.231|-|9
218.92.0.233|-|9
218.92.0.236|-|9
45.148.10.67|-|8
218.92.0.103|-|8
218.92.0.222|-|8
218.92.0.232|-|8
218.92.0.237|-|8
51.79.4.11|ip11.ip-51-79-4.net|7
58.211.18.68|-|7
80.82.77.202|rnd.group-ib.com|7
92.118.39.57|-|7
92.118.39.65|-|7
162.142.125.122|scanner-20.ch1.censys-scanner.com|7
183.162.197.57|-|7
193.32.162.84|-|7
193.32.162.97|-|7
218.92.0.112|-|7
218.92.0.198|-|7
218.92.0.235|-|7
14.63.166.251|-|7
160.191.89.4|-|7
176.109.67.65|-|7
180.178.94.73|-|7
43.240.223.15|-|7
45.84.107.17|exit-12.tor.r0cket.net|7
92.118.39.61|-|7
