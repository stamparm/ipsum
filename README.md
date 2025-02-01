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

Wall of Shame (2025-02-01)
----

|IP|DNS lookup|Number of (black)lists|
|---|---|--:|
2.57.122.194|-|8
83.222.191.62|-|8
93.126.53.41|-|8
194.0.234.37|-|8
194.0.234.38|-|8
218.92.0.114|-|8
218.92.0.222|-|8
111.67.194.206|-|8
164.152.61.233|-|8
80.82.77.139|dojo.census.shodan.io|7
2.57.122.189|-|7
2.57.122.193|-|7
92.118.39.73|-|7
92.118.39.75|-|7
114.143.74.50|static-50.74.143.114-tataidc.co.in|7
137.184.238.110|-|7
162.142.125.32|-|7
162.142.125.33|-|7
167.94.145.109|-|7
167.94.146.50|-|7
184.168.122.184|184.122.168.184.host.secureserver.net|7
206.168.34.52|-|7
207.90.244.11|-|7
218.92.0.111|-|7
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
218.92.0.230|-|7
218.92.0.231|-|7
218.92.0.232|-|7
218.92.0.233|-|7
218.92.0.235|-|7
218.92.0.236|-|7
218.92.0.237|-|7
103.188.177.46|-|7
103.87.207.254|-|7
136.232.203.134|-|7
167.94.146.52|-|7
167.94.146.58|-|7
170.64.166.123|-|7
209.38.228.147|core1.bbe.masterit-dev.cloud|7
220.80.223.144|-|7
36.110.228.254|-|7
37.58.18.237|-|7
50.84.211.204|syn-050-084-211-204.biz.spectrum.com|7
51.161.153.48|vps-b81d3b57.vps.ovh.ca|7
5.196.114.220|vps212.cloud.mg|7
61.220.44.44|61-220-44-44.hinet-ip.hinet.net|7
91.205.219.185|-|7
96.67.59.65|-|7
161.35.84.45|-|7
164.90.204.17|-|7
178.160.211.111|-|7
181.225.140.68|-|7
193.32.162.131|-|7
193.32.162.132|-|7
193.32.162.133|-|7
193.32.162.134|-|7
89.168.18.25|-|7
92.118.39.72|-|7
92.118.39.87|-|7
