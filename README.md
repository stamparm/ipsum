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
apt-get -qq install iptables ipset
ipset -q flush ipsum
ipset -q create ipsum hash:ip
for ip in $(curl --compressed https://raw.githubusercontent.com/stamparm/ipsum/master/ipsum.txt 2>/dev/null | grep -v "#" | grep -v -E "\s[1-2]$" | cut -f 1); do ipset add ipsum $ip; done
iptables -D INPUT -m set --match-set ipsum src -j DROP 2>/dev/null
iptables -I INPUT -m set --match-set ipsum src -j DROP
```

In directory [levels](levels) you can find preprocessed raw IP lists based on number of blacklist occurrences (e.g. [levels/3.txt](levels/3.txt) holds IP addresses that can be found on 3 or more blacklists).

Wall of Shame (2025-01-28)
----

|IP|DNS lookup|Number of (black)lists|
|---|---|--:|
193.32.162.139|-|8
218.92.0.111|-|8
218.92.0.114|-|8
218.92.0.222|-|8
218.92.0.233|-|8
164.152.61.233|-|8
2.57.122.192|-|7
92.118.39.71|-|7
92.118.39.72|-|7
92.118.39.75|-|7
167.94.138.112|scanner-27.ch1.censys-scanner.com|7
167.94.145.97|-|7
167.94.145.109|-|7
167.94.145.111|-|7
167.94.146.54|-|7
193.32.162.132|-|7
207.90.244.11|-|7
218.92.0.112|-|7
218.92.0.198|-|7
218.92.0.216|-|7
218.92.0.217|-|7
218.92.0.218|-|7
218.92.0.219|-|7
218.92.0.220|-|7
218.92.0.221|-|7
218.92.0.223|-|7
218.92.0.225|-|7
218.92.0.226|-|7
218.92.0.227|-|7
218.92.0.228|-|7
218.92.0.229|-|7
218.92.0.230|-|7
218.92.0.231|-|7
218.92.0.232|-|7
218.92.0.235|-|7
218.92.0.236|-|7
218.92.0.237|-|7
103.188.177.46|-|7
115.91.91.182|-|7
118.193.77.158|-|7
162.142.125.34|-|7
167.94.145.100|scanner-01.fr7.censys-scanner.com|7
185.157.223.126|185-157-223-126-static.glesys.net|7
187.210.77.100|customer-187-210-77-100.uninet-ide.com.mx|7
194.0.234.37|-|7
194.0.234.38|-|7
213.55.85.202|-|7
218.150.246.42|-|7
45.119.81.249|-|7
45.120.216.232|-|7
102.211.152.45|45.152.211.102.angolacables.ao|7
112.95.227.2|-|7
134.209.120.69|-|7
193.32.162.131|-|7
193.32.162.134|-|7
75.178.99.71|syn-075-178-099-071.res.spectrum.com|7
89.168.18.25|-|7
98.175.165.229|wsip-98-175-165-229.dc.dc.cox.net|7
