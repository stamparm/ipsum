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

Wall of Shame (2025-06-07)
----

|IP|DNS lookup|Number of (black)lists|
|---|---|--:|
176.28.14.206|lvps176-28-14-206.dedicated.hosteurope.de|10
185.93.89.118|-|10
193.32.162.157|-|10
185.156.73.233|-|9
185.156.73.234|-|9
3.137.73.221|scan.cypex.ai|8
3.143.33.63|scan.cypex.ai|8
45.82.78.254|-|8
71.6.199.23|einstein.census.shodan.io|8
80.82.77.33|sky.census.shodan.io|8
80.82.77.202|rnd.group-ib.com|8
80.94.95.115|-|8
94.159.102.167|-|8
103.237.144.204|-|8
142.93.13.29|-|8
157.245.227.101|-|8
162.142.125.213|scanner-05.ch1.censys-scanner.com|8
165.227.210.57|-|8
167.94.145.96|-|8
167.94.145.98|-|8
167.94.145.101|-|8
167.94.145.104|-|8
167.94.145.105|-|8
167.94.145.110|-|8
167.94.146.61|-|8
185.165.191.27|red.census.shodan.io|8
192.241.188.19|-|8
195.3.221.137|smtp9.munxkey.com.com|8
223.130.11.165|-|8
2.59.22.234|red3.census.shodan.io|7
3.132.23.201|scan.cypex.ai|7
35.203.210.121|121.210.203.35.bc.googleusercontent.com|7
41.231.37.153|-|7
43.157.251.222|-|7
45.43.33.218|chen.probe.onyphe.net|7
45.119.81.249|-|7
45.131.155.254|-|7
46.101.210.71|-|7
51.89.166.236|vps-5f0ef624.vps.ovh.net|7
68.232.175.53|68.232.175.53.vultrusercontent.com|7
71.6.134.231|-|7
71.6.146.186|inspire.census.shodan.io|7
80.82.70.133|rnd.group-ib.com|7
80.94.95.116|-|7
85.18.236.229|85-18-236-229.ip.fastwebnet.it|7
86.54.31.34|wine.census.shodan.io|7
86.54.31.38|blue2.census.shodan.io|7
89.97.218.142|89-97-218-142.ip19.fastwebnet.it|7
93.174.95.106|battery.census.shodan.io|7
95.167.225.76|-|7
95.182.115.26|-|7
104.244.77.50|-|7
104.248.35.120|-|7
114.217.26.245|-|7
117.6.44.221|-|7
125.25.45.142|node-8zy.pool-125-25.dynamic.nt-isp.net|7
125.94.40.184|-|7
134.199.195.177|-|7
139.59.173.98|-|7
140.246.92.156|-|7
147.185.132.43|-|7
154.92.111.94|-|7
159.65.24.193|-|7
159.89.191.131|-|7
159.223.11.102|-|7
162.142.125.38|-|7
162.142.125.123|scanner-20.ch1.censys-scanner.com|7
162.142.125.196|-|7
162.142.125.198|-|7
162.142.125.210|scanner-05.ch1.censys-scanner.com|7
162.142.125.217|scanner-05.ch1.censys-scanner.com|7
162.142.125.218|scanner-25.ch1.censys-scanner.com|7
162.142.125.220|scanner-25.ch1.censys-scanner.com|7
162.142.125.221|scanner-25.ch1.censys-scanner.com|7
162.251.63.12|12-63-251-162.clients.gthost.com|7
165.154.163.10|-|7
167.94.145.99|-|7
167.94.145.100|scanner-01.fr7.censys-scanner.com|7
167.94.145.106|-|7
167.94.145.107|-|7
167.94.145.108|-|7
167.94.146.48|-|7
167.94.146.50|-|7
167.94.146.55|-|7
167.94.146.56|-|7
167.94.146.57|-|7
167.94.146.58|-|7
167.94.146.60|-|7
180.178.94.73|-|7
182.93.50.90|n18293z50l90.static.ctmip.net|7
185.196.220.81|-|7
185.235.16.48|-|7
193.32.162.84|-|7
197.227.8.186|-|7
197.253.54.22|-|7
198.24.79.245|syn-198-024-079-245.biz.spectrum.com|7
198.46.207.98|198-46-207-98-host.colocrossing.com|7
198.199.71.30|-|7
199.45.154.122|scanner-201.hk2.censys-scanner.com|7
199.45.154.158|scanner-205.hk2.censys-scanner.com|7
199.45.155.72|scanner-202.hk2.censys-scanner.com|7
199.45.155.73|scanner-202.hk2.censys-scanner.com|7
206.189.45.230|-|7
216.172.190.206|col.colettelounge.com|7
217.182.230.0|ip0.ip-217-182-230.eu|7
218.21.230.174|-|7
220.80.223.144|-|7
222.105.183.150|-|7
222.172.32.246|-|7
