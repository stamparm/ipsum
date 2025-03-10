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

Wall of Shame (2025-03-10)
----

|IP|DNS lookup|Number of (black)lists|
|---|---|--:|
218.92.0.216|-|8
218.92.0.217|-|8
218.92.0.228|-|8
185.213.173.44|-|8
185.213.173.51|-|8
2.57.122.189|-|7
34.93.121.198|198.121.93.34.bc.googleusercontent.com|7
34.100.211.26|26.211.100.34.bc.googleusercontent.com|7
92.118.39.74|-|7
92.118.39.87|-|7
156.59.97.86|-|7
193.32.162.130|-|7
193.32.162.132|-|7
193.32.162.133|-|7
193.32.162.134|-|7
193.32.162.136|-|7
193.32.162.137|-|7
194.0.234.35|-|7
207.90.244.2|-|7
218.92.0.111|-|7
218.92.0.198|-|7
218.92.0.220|-|7
218.92.0.222|-|7
218.92.0.223|-|7
218.92.0.225|-|7
218.92.0.235|-|7
134.209.120.69|-|7
43.248.173.166|-|7
