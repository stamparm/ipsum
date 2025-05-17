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

Wall of Shame (2025-05-17)
----

|IP|DNS lookup|Number of (black)lists|
|---|---|--:|
218.92.0.198|-|9
218.92.0.217|-|9
218.92.0.222|-|9
218.92.0.223|-|9
218.92.0.232|-|9
218.92.0.235|-|9
218.92.0.237|-|9
92.118.39.65|-|8
185.93.89.118|-|8
193.32.162.84|-|8
193.32.162.89|-|8
193.32.162.157|-|8
218.92.0.103|-|8
218.92.0.111|-|8
218.92.0.112|-|8
218.92.0.228|-|8
218.92.0.233|-|8
120.245.84.71|-|8
2.57.122.57|-|7
92.118.39.57|-|7
92.118.39.90|-|7
193.32.162.97|-|7
196.251.83.136|undefined.hostname.localhost|7
218.92.0.216|-|7
218.92.0.218|-|7
218.92.0.219|-|7
218.92.0.220|-|7
218.92.0.221|-|7
218.92.0.225|-|7
218.92.0.226|-|7
218.92.0.227|-|7
218.92.0.229|-|7
218.92.0.230|-|7
218.92.0.231|-|7
218.92.0.236|-|7
103.154.143.162|ip-103-154-143-162.moratelindo.net.id|7
103.39.93.93|-|7
160.20.104.81|-|7
177.223.60.82|-|7
180.178.94.73|-|7
195.178.110.232|-|7
195.178.110.6|-|7
198.199.71.30|-|7
45.148.10.67|-|7
