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

Wall of Shame (2024-12-10)
----

|IP|DNS lookup|Number of (black)lists|
|---|---|--:|
218.92.0.198|-|9
218.92.0.217|-|9
218.92.0.218|-|9
218.92.0.220|-|9
218.92.0.228|-|9
218.92.0.229|-|9
218.92.0.230|-|9
218.92.0.232|-|9
218.92.0.233|-|9
14.103.165.154|-|8
45.148.10.203|-|8
92.255.85.253|-|8
148.153.158.114|-|8
195.178.110.34|-|8
218.92.0.111|-|8
218.92.0.216|-|8
218.92.0.223|-|8
218.92.0.225|-|8
218.92.0.226|-|8
218.92.0.227|-|8
218.92.0.231|-|8
218.92.0.235|-|8
218.92.0.236|-|8
218.92.0.237|-|8
220.95.14.102|-|8
211.253.10.96|-|7
2.57.122.32|-|7
2.57.122.33|-|7
4.213.162.155|-|7
20.21.136.216|-|7
45.148.10.46|-|7
62.232.51.185|-|7
80.82.77.202|rnd.group-ib.com|7
92.255.85.107|-|7
92.255.85.188|-|7
92.255.85.189|-|7
167.99.157.155|-|7
181.214.147.26|-|7
182.215.66.232|-|7
183.6.76.2|-|7
193.32.162.79|-|7
194.169.175.37|-|7
195.178.110.67|-|7
202.95.12.147|-|7
218.92.0.114|-|7
218.92.0.219|-|7
220.77.245.227|-|7
203.81.86.34|-|7
91.227.62.23|-|7
