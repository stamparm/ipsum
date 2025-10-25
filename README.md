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

Wall of Shame (2025-10-25)
----

|IP|DNS lookup|Number of (black)lists|
|---|---|--:|
193.32.162.157|-|10
62.60.131.157|-|9
114.111.54.188|-|9
193.46.255.20|hostingmailto112.statics.servermail.org|9
193.46.255.244|hostingmailto161.statics.servermail.org|9
3.131.215.38|ec2-3-131-215-38.us-east-2.compute.amazonaws.com|8
80.82.77.33|sky.census.shodan.io|8
80.94.93.119|-|8
80.94.93.233|-|8
92.118.39.62|-|8
162.142.125.115|-|8
192.210.160.141|192-210-160-141-host.colocrossing.com|8
193.32.162.145|-|8
193.32.162.146|-|8
193.46.255.7|hostingmailto221.statics.servermail.org|8
193.46.255.33|hostingmailto181.statics.servermail.org|8
193.46.255.99|hostingmailto251.statics.servermail.org|8
193.46.255.103|hostingmailto005.statics.servermail.org|8
193.46.255.159|hostingmailto066.statics.servermail.org|8
193.46.255.217|hostingmailto131.statics.servermail.org|8
196.251.80.79|-|8
198.98.53.110|-|8
2.57.121.25|hosting25.tronicsat.com|7
20.55.39.239|-|7
34.59.175.189|189.175.59.34.bc.googleusercontent.com|7
34.171.29.151|151.29.171.34.bc.googleusercontent.com|7
36.140.33.10|-|7
43.252.231.122|-|7
78.128.112.74|ip-112-74.4vendeta.com|7
80.82.77.139|dojo.census.shodan.io|7
89.97.218.142|89-97-218-142.ip19.fastwebnet.it|7
92.118.39.92|-|7
92.118.39.95|-|7
93.174.95.106|battery.census.shodan.io|7
94.254.0.234|h-94-254-0-234.na.cust.bahnhof.se|7
101.250.60.4|-|7
103.48.192.48|-|7
107.150.101.17|-|7
125.21.59.218|-|7
128.14.23.34|-|7
147.182.194.60|-|7
162.142.125.42|scanner-201.ch1.censys-scanner.com|7
162.142.125.194|scanner-202.ch1.censys-scanner.com|7
162.142.125.204|scanner-202.ch1.censys-scanner.com|7
162.142.125.208|scanner-207.ch1.censys-scanner.com|7
167.94.146.48|-|7
167.94.146.53|-|7
176.235.182.73|-|7
177.229.197.38|customer-MCA-TGZ-197-38.megared.net.mx|7
181.212.81.228|181-212-81-228.baf.movistar.cl|7
183.82.126.193|183.82.126.193.actcorp.in|7
185.141.132.26|-|7
188.18.49.50|-|7
189.7.17.61|bd07113d.virtua.com.br|7
193.32.162.151|-|7
195.87.80.171|-|7
196.251.80.165|-|7
197.5.145.8|-|7
199.45.154.144|scanner-205.hk2.censys-scanner.com|7
204.76.203.28|hosted-by.pfcloud.io|7
206.168.34.43|unused-space.coop.net|7
206.168.34.119|unused-space.coop.net|7
206.168.34.193|unused-space.coop.net|7
206.168.34.215|unused-space.coop.net|7
223.123.92.149|-|7
