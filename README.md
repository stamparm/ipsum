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

Wall of Shame (2024-08-07)
----

|IP|DNS lookup|Number of (black)lists|
|---|---|--:|
194.50.16.221|-|10
61.177.172.136|-|9
61.177.172.160|-|9
218.92.0.112|-|9
218.92.0.113|-|9
180.101.88.197|-|9
180.101.88.196|-|9
61.177.172.179|-|9
218.92.0.107|-|9
218.92.0.56|-|9
104.248.194.114|-|9
61.177.172.140|-|9
218.92.0.22|-|9
218.92.0.24|-|9
180.101.88.205|-|9
45.148.10.202|-|9
218.92.0.31|-|8
212.113.102.128|server3.aeza.network|8
140.246.28.249|-|8
85.209.11.227|-|8
192.42.116.208|11.tor-exit.nothingtohide.nl|8
212.113.102.130|server2.aeza.network|8
92.118.39.133|-|8
211.253.10.96|-|8
104.234.254.118|-|8
83.222.191.62|-|8
80.82.77.139|dojo.census.shodan.io|8
221.222.184.230|-|8
218.92.0.27|-|8
193.201.9.156|-|7
1.83.124.4|-|7
80.82.77.33|sky.census.shodan.io|7
218.92.0.34|-|7
203.205.37.233|static.cmcti.vn|7
200.105.183.118|static-200-105-183-118.acelerate.net|7
159.203.177.127|-|7
186.10.125.209|z407.entelchile.net|7
185.220.100.255|tor-exit-4.zbau.f3netze.de|7
66.66.116.251|syn-066-066-116-251.res.spectrum.com|7
54.37.10.124|vps-1e3810b9.vps.ovh.net|7
212.113.102.66|cozy-baseball.aeza.network|7
202.165.24.77|-|7
92.154.95.236|lstlambert-656-1-48-236.w92-154.abo.wanadoo.fr|7
203.106.164.74|gbk-164-74.tm.net.my|7
185.129.62.62|tor01.zencurity.com|7
185.220.100.240|tor-exit-13.zbau.f3netze.de|7
185.106.94.195|tor.node15.shadowbrokers.eu|7
193.32.162.79|-|7
35.207.98.222|222.98.207.35.bc.googleusercontent.com|7
71.6.146.186|inspire.census.shodan.io|7
125.133.0.85|-|7
212.76.27.39|-|7
45.148.10.251|-|7
103.142.86.221|-|7
207.90.244.3|-|7
93.174.95.106|battery.census.shodan.io|7
71.6.134.232|-|7
192.42.116.184|32.tor-exit.nothingtohide.nl|7
66.240.236.109|ubuntu20236109.aspadmin.net|7
41.59.87.18|18.87-59-41.static-zone.ttcldata.net|7
194.169.175.36|-|7
194.169.175.35|-|7
95.214.27.253|-|7
192.3.10.31|192-3-10-31-host.colocrossing.com|7
82.151.65.155|-|7
190.85.15.251|-|7
78.153.139.165|katharsis-vps-1.ip-ptr.tech|7
128.199.182.19|-|7
