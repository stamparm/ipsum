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

Wall of Shame (2025-11-01)
----

|IP|DNS lookup|Number of (black)lists|
|---|---|--:|
93.174.95.106|battery.census.shodan.io|9
193.32.162.157|-|9
2.57.121.112|dns112.personaliseplus.com|8
34.59.175.189|189.175.59.34.bc.googleusercontent.com|8
80.94.93.119|-|8
92.118.39.95|-|8
192.210.160.141|192-210-160-141-host.colocrossing.com|8
193.32.162.146|-|8
193.46.255.103|hostingmailto005.statics.servermail.org|8
198.98.53.110|-|8
3.130.96.91|scan.cypex.ai|7
3.131.215.38|ec2-3-131-215-38.us-east-2.compute.amazonaws.com|7
43.252.231.122|-|7
45.81.23.49|-|7
45.159.189.193||7
62.60.131.157|-|7
80.82.77.33|sky.census.shodan.io|7
80.82.77.139|dojo.census.shodan.io|7
80.94.93.233|-|7
92.118.39.62|-|7
103.56.115.6|-|7
114.111.54.188|-|7
162.142.125.36|scanner-201.ch1.censys-scanner.com|7
162.142.125.125|-|7
162.142.125.194|scanner-202.ch1.censys-scanner.com|7
162.142.125.210|scanner-207.ch1.censys-scanner.com|7
162.142.125.216|scanner-207.ch1.censys-scanner.com|7
167.94.146.58|-|7
193.32.162.145|-|7
193.46.255.7|hostingmailto221.statics.servermail.org|7
193.46.255.20|hostingmailto112.statics.servermail.org|7
193.46.255.33|hostingmailto181.statics.servermail.org|7
193.46.255.99|hostingmailto251.statics.servermail.org|7
193.46.255.159|hostingmailto066.statics.servermail.org|7
193.46.255.217|hostingmailto131.statics.servermail.org|7
193.46.255.244|hostingmailto161.statics.servermail.org|7
195.87.80.171|-|7
199.45.155.94|scanner-204.hk2.censys-scanner.com|7
204.76.203.28|hosted-by.pfcloud.io|7
