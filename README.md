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

Wall of Shame (2025-03-22)
----

|IP|DNS lookup|Number of (black)lists|
|---|---|--:|
134.209.120.69|-|9
92.255.85.188|-|8
140.246.92.156|-|8
194.0.234.35|-|8
194.0.234.36|-|8
218.92.0.103|-|8
218.92.0.218|-|8
218.92.0.226|-|8
218.92.0.231|-|8
218.92.0.237|-|8
137.220.134.234|-|8
185.213.173.44|-|8
93.174.95.106|battery.census.shodan.io|7
92.118.39.73|-|7
92.118.39.75|-|7
111.23.122.227|-|7
111.67.196.52|-|7
143.244.178.70|-|7
167.94.145.96|-|7
167.94.145.99|-|7
167.94.145.103|-|7
182.215.66.232|-|7
195.178.110.18|-|7
195.178.110.26|-|7
195.178.110.63|-|7
218.92.0.111|-|7
218.92.0.112|-|7
218.92.0.198|-|7
218.92.0.216|-|7
218.92.0.217|-|7
218.92.0.219|-|7
218.92.0.220|-|7
218.92.0.221|-|7
218.92.0.222|-|7
218.92.0.223|-|7
218.92.0.225|-|7
218.92.0.227|-|7
218.92.0.228|-|7
218.92.0.229|-|7
218.92.0.230|-|7
218.92.0.232|-|7
218.92.0.233|-|7
218.92.0.235|-|7
218.92.0.236|-|7
160.187.147.127|-|7
184.168.122.184|184.122.168.184.host.secureserver.net|7
185.213.173.51|-|7
92.255.85.107|-|7
92.255.85.253|-|7
