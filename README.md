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

Wall of Shame (2025-07-12)
----

|IP|DNS lookup|Number of (black)lists|
|---|---|--:|
176.65.148.55|hosted-by.pfcloud.io|10
92.118.39.92|-|9
92.118.39.95|-|9
93.123.109.181|-|9
147.182.194.60|-|9
176.65.148.12|hosted-by.pfcloud.io|9
34.171.244.191|191.244.171.34.bc.googleusercontent.com|8
45.148.10.240|-|8
80.82.77.33|sky.census.shodan.io|8
80.94.92.94|-|8
93.123.109.191|-|8
125.17.108.32|server.serverinfo.in.net|8
156.241.0.211|-|8
176.65.149.226|hosted-by.pfcloud.io|8
185.93.89.118|-|8
193.32.162.141|-|8
193.32.162.151|-|8
193.32.162.157|-|8
195.178.110.108|-|8
195.178.110.125|-|8
195.178.110.160|-|8
195.178.110.211|-|8
195.178.110.224|-|8
216.10.250.218|server.digitalspoint.com|8
36.64.68.99|-|7
36.255.3.203|-|7
78.128.112.74|ip-112-74.4vendeta.com|7
80.94.92.97|-|7
82.207.8.154|154-8-207-82.pool.ukrtel.net|7
86.54.25.130|-|7
92.118.39.71|-|7
93.123.109.189|-|7
96.78.175.36|-|7
103.49.238.104|ip103-49-238-104.cloudhost.web.id|7
103.63.25.13|ip103-63-25-13.cloudhost.web.id|7
104.244.77.50|-|7
118.194.253.212|-|7
121.164.230.162|-|7
162.142.125.127|scanner-20.ch1.censys-scanner.com|7
176.109.80.72|-|7
176.196.236.146|-|7
185.156.73.234|-|7
186.96.166.237|fixed-186-96-166-237.totalplay.net|7
190.111.211.81|static.81.211.111.190.cps.com.ar|7
193.32.162.145|-|7
196.251.69.18|-|7
196.251.69.107|-|7
196.251.69.157|-|7
196.251.117.208|-|7
201.76.120.30|30.120.76.201.in-addr.arpa.verointernet.com.br|7
202.157.177.161|-|7
204.44.127.231|-|7
210.91.73.167|-|7
211.115.190.135|-|7
