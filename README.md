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

Wall of Shame (2025-01-04)
----

|IP|DNS lookup|Number of (black)lists|
|---|---|--:|
92.255.85.188|-|9
152.53.119.28|v2202412247634306081.nicesrv.de|9
161.132.48.181|-|9
194.0.234.37|-|9
194.0.234.38|-|9
167.172.95.189|-|9
80.82.77.139|dojo.census.shodan.io|8
2.57.122.189|-|8
2.57.122.190|-|8
2.57.122.192|-|8
83.222.191.62|-|8
92.255.57.132|-|8
102.211.152.45|45.152.211.102.angolacables.ao|8
122.114.12.80|-|8
218.92.0.221|-|8
218.92.0.225|-|8
2.57.122.186|-|7
2.57.122.193|-|7
2.57.122.194|-|7
36.110.228.254|-|7
45.118.162.83|-|7
45.148.10.240|-|7
71.6.199.23|einstein.census.shodan.io|7
74.73.241.225|syn-074-073-241-225.res.spectrum.com|7
80.82.77.202|rnd.group-ib.com|7
80.94.95.239|-|7
87.197.161.130|static-bband-130.87-197-161.telecom.sk|7
92.255.85.189|-|7
103.172.236.15|-|7
116.98.170.56|dynamic-adsl.viettel.vn|7
147.185.132.90|-|7
167.94.145.101|-|7
185.142.236.34|hat.census.shodan.io|7
185.165.191.27|-|7
195.144.21.56|red3.census.shodan.io|7
199.45.154.138|scanner-203.hk2.censys-scanner.com|7
218.92.0.111|-|7
218.92.0.112|-|7
218.92.0.114|-|7
218.92.0.198|-|7
218.92.0.216|-|7
218.92.0.217|-|7
218.92.0.218|-|7
218.92.0.219|-|7
218.92.0.220|-|7
218.92.0.222|-|7
218.92.0.223|-|7
218.92.0.226|-|7
218.92.0.227|-|7
218.92.0.228|-|7
218.92.0.229|-|7
218.92.0.230|-|7
218.92.0.231|-|7
218.92.0.232|-|7
218.92.0.233|-|7
218.92.0.235|-|7
218.92.0.236|-|7
218.92.0.237|-|7
142.93.231.154|-|7
192.42.116.218|44.tor-exit.nothingtohide.nl|7
130.250.134.35|-|7
137.184.189.35|-|7
137.184.190.239|-|7
165.227.147.75|-|7
185.213.174.118|-|7
192.42.116.214|17.tor-exit.nothingtohide.nl|7
34.171.131.12|12.131.171.34.bc.googleusercontent.com|7
45.5.159.34|-|7
92.255.85.107|-|7
92.255.85.253|-|7
