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

Wall of Shame (2025-01-21)
----

|IP|DNS lookup|Number of (black)lists|
|---|---|--:|
218.92.0.237|-|10
5.180.253.220|ptr.default|9
2.57.122.190|-|8
2.57.122.192|-|8
80.82.77.202|rnd.group-ib.com|8
83.222.191.62|-|8
92.118.39.73|-|8
92.255.57.132|-|8
93.126.53.41|-|8
162.142.125.219|scanner-25.ch1.censys-scanner.com|8
167.94.138.183|-|8
167.94.145.108|-|8
167.94.146.48|-|8
178.160.211.111|-|8
193.32.162.132|-|8
193.32.162.134|-|8
194.0.234.37|-|8
194.0.234.38|-|8
218.92.0.112|-|8
218.92.0.235|-|8
71.6.135.131|soda.census.shodan.io|7
80.82.77.139|dojo.census.shodan.io|7
2.57.122.193|-|7
5.101.0.66|-|7
36.110.228.254|-|7
45.148.10.240|-|7
71.6.199.23|einstein.census.shodan.io|7
75.178.99.71|syn-075-178-099-071.res.spectrum.com|7
89.248.172.16|house.census.shodan.io|7
92.118.39.71|-|7
92.118.39.74|-|7
102.211.152.45|45.152.211.102.angolacables.ao|7
103.76.84.164|-|7
134.209.149.183|cyntel.csworkcenter.com|7
138.197.45.57|-|7
162.142.125.193|-|7
162.142.125.206|-|7
162.142.125.214|scanner-05.ch1.censys-scanner.com|7
162.142.125.220|scanner-25.ch1.censys-scanner.com|7
162.142.125.223|scanner-25.ch1.censys-scanner.com|7
167.94.138.61|scanner-07.ch1.censys-scanner.com|7
167.94.145.97|-|7
167.94.145.98|-|7
167.94.145.101|-|7
167.94.145.103|-|7
167.94.145.104|-|7
167.94.145.106|-|7
167.94.145.107|-|7
167.94.145.110|-|7
167.94.146.51|-|7
167.94.146.58|-|7
167.94.146.60|-|7
185.165.191.27|-|7
193.32.162.130|-|7
193.32.162.131|-|7
193.32.162.135|-|7
193.32.162.136|-|7
193.32.162.137|-|7
193.32.162.139|-|7
206.168.34.41|-|7
207.90.244.11|-|7
218.92.0.111|-|7
218.92.0.114|-|7
218.92.0.198|-|7
218.92.0.216|-|7
218.92.0.217|-|7
218.92.0.218|-|7
218.92.0.219|-|7
218.92.0.220|-|7
218.92.0.221|-|7
218.92.0.222|-|7
218.92.0.223|-|7
218.92.0.225|-|7
218.92.0.226|-|7
218.92.0.227|-|7
218.92.0.228|-|7
218.92.0.229|-|7
218.92.0.230|-|7
218.92.0.231|-|7
218.92.0.232|-|7
218.92.0.233|-|7
218.92.0.236|-|7
124.152.91.221|-|7
159.89.169.158|-|7
195.19.97.203|-|7
199.45.155.107|scanner-206.hk2.censys-scanner.com|7
213.55.85.202|-|7
159.89.170.239|-|7
50.66.57.232|S010602070de7ecbf.cg.shawcable.net|7
