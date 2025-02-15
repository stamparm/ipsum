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

Wall of Shame (2025-02-15)
----

|IP|DNS lookup|Number of (black)lists|
|---|---|--:|
37.44.238.88|ssd5-6208.10083|9
184.168.122.184|184.122.168.184.host.secureserver.net|9
218.92.0.229|-|9
2.57.122.189|-|8
34.93.121.198|198.121.93.34.bc.googleusercontent.com|8
92.118.39.71|-|8
92.118.39.72|-|8
92.118.39.74|-|8
134.209.120.69|-|8
193.32.162.132|-|8
194.0.234.37|-|8
194.0.234.38|-|8
218.92.0.219|-|8
93.174.95.106|battery.census.shodan.io|7
34.171.131.12|12.131.171.34.bc.googleusercontent.com|7
80.82.77.202|rnd.group-ib.com|7
92.118.39.73|-|7
92.118.39.75|-|7
92.255.57.132|-|7
178.160.211.111|-|7
180.178.94.73|-|7
185.224.3.211|-|7
193.32.162.131|-|7
193.32.162.136|-|7
195.178.110.76|-|7
218.92.0.216|-|7
218.92.0.217|-|7
218.92.0.220|-|7
218.92.0.223|-|7
218.92.0.226|-|7
218.92.0.227|-|7
218.92.0.228|-|7
218.92.0.230|-|7
218.92.0.236|-|7
103.226.248.206|-|7
111.67.197.183|-|7
193.32.162.130|-|7
193.32.162.133|-|7
193.32.162.139|-|7
194.126.202.234|-|7
220.80.223.144|-|7
36.158.177.47|-|7
37.148.204.40|n1nlgriddb50060-01.shr.prod.ams1.secureserver.net|7
46.105.70.190|ns3236417.ip-46-105-70.eu|7
92.255.85.37|-|7
