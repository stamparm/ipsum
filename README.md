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

Wall of Shame (2025-04-05)
----

|IP|DNS lookup|Number of (black)lists|
|---|---|--:|
160.191.89.4|-|8
196.251.67.42|-|8
218.92.0.111|-|8
218.92.0.221|-|8
218.92.0.223|-|8
218.92.0.227|-|8
112.6.214.244|-|8
80.82.77.33|sky.census.shodan.io|7
80.82.77.139|dojo.census.shodan.io|7
24.234.95.87|wsip-24-234-95-87.lv.lv.cox.net|7
45.148.10.240|-|7
92.255.85.188|-|7
103.197.184.162|-|7
134.209.120.69|-|7
167.94.146.61|-|7
184.168.122.184|184.122.168.184.host.secureserver.net|7
193.32.162.74|-|7
194.0.234.35|-|7
194.0.234.36|-|7
195.178.110.31|-|7
195.178.110.207|-|7
196.251.66.71|-|7
196.251.87.42|-|7
196.251.87.45|-|7
196.251.87.54|-|7
196.251.87.74|-|7
196.251.118.184|-|7
218.92.0.112|-|7
218.92.0.198|-|7
218.92.0.216|-|7
218.92.0.217|-|7
218.92.0.218|-|7
218.92.0.219|-|7
218.92.0.220|-|7
218.92.0.222|-|7
218.92.0.225|-|7
218.92.0.226|-|7
218.92.0.228|-|7
218.92.0.229|-|7
218.92.0.230|-|7
218.92.0.231|-|7
218.92.0.232|-|7
218.92.0.233|-|7
218.92.0.235|-|7
218.92.0.236|-|7
218.92.0.237|-|7
103.154.143.162|ip-103-154-143-162.moratelindo.net.id|7
112.95.227.2|-|7
150.5.156.34|-|7
180.178.94.73|-|7
216.10.250.218|server.digitalspoint.com|7
92.255.85.107|-|7
92.255.85.253|-|7
