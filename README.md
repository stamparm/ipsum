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

Wall of Shame (2025-10-18)
----

|IP|DNS lookup|Number of (black)lists|
|---|---|--:|
193.32.162.157|-|10
80.94.93.119|-|9
80.94.93.233|-|9
193.46.255.7|hostingmailto221.statics.servermail.org|9
193.46.255.103|hostingmailto005.statics.servermail.org|9
34.59.175.189|189.175.59.34.bc.googleusercontent.com|8
36.140.33.10|-|8
62.60.131.157|-|8
80.82.77.139|dojo.census.shodan.io|8
80.94.93.176|-|8
80.94.95.115|-|8
93.174.95.106|battery.census.shodan.io|8
192.210.160.141|192-210-160-141-host.colocrossing.com|8
193.46.255.20|hostingmailto112.statics.servermail.org|8
193.46.255.33|hostingmailto181.statics.servermail.org|8
193.46.255.99|hostingmailto251.statics.servermail.org|8
193.46.255.159|hostingmailto066.statics.servermail.org|8
193.46.255.217|hostingmailto131.statics.servermail.org|8
193.46.255.244|hostingmailto161.statics.servermail.org|8
194.0.234.19|-|8
3.134.148.59|scan.cypex.ai|7
43.252.231.122|-|7
45.81.23.49|-|7
45.157.157.74|-|7
45.172.152.74|-|7
47.236.76.100|-|7
80.82.77.33|sky.census.shodan.io|7
80.82.77.202|rnd.group-ib.com|7
80.191.247.45|-|7
89.248.167.131|mason.census.shodan.io|7
91.224.92.108|srv-91-224-92-108.serveroffer.net|7
101.250.60.4|-|7
103.182.132.154|-|7
103.237.144.204|-|7
107.170.228.16|wfinancial20230805-s-1vcpu-2gb-sfo1-01-ubuntu-16.04|7
114.111.54.188|-|7
121.186.31.54|-|7
128.199.157.145|-|7
136.26.36.177|136-26-36-177.cab.webpass.net|7
162.142.125.118|-|7
162.142.125.195|scanner-202.ch1.censys-scanner.com|7
162.142.125.211|scanner-207.ch1.censys-scanner.com|7
176.235.182.73|-|7
183.110.116.126|-|7
186.56.11.17|-|7
187.16.96.250|mvx-187-16-96-250.mundivox.com|7
190.129.122.185|-|7
195.87.80.171|-|7
196.251.80.79|-|7
197.5.145.102|-|7
197.227.8.186|-|7
198.98.53.110|-|7
221.156.126.1|-|7
223.123.92.149|-|7
