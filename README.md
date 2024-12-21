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

Wall of Shame (2024-12-21)
----

|IP|DNS lookup|Number of (black)lists|
|---|---|--:|
182.215.66.232|-|8
185.213.174.118|-|8
203.81.86.34|-|8
218.92.0.111|-|8
218.92.0.223|-|8
80.82.77.33|sky.census.shodan.io|7
80.82.77.139|dojo.census.shodan.io|7
89.97.218.142|89-97-218-142.ip19.fastwebnet.it|7
2.57.122.189|-|7
2.57.122.194|-|7
4.213.162.155|-|7
36.50.135.251|-|7
59.167.119.16|mail.ehealthconsultants.com.au|7
77.105.132.132|46801.landvps.online|7
92.255.85.107|-|7
92.255.85.253|-|7
111.67.196.240|-|7
118.184.153.42|-|7
148.153.158.114|-|7
167.94.146.52|-|7
167.94.146.58|-|7
183.6.76.2|-|7
199.45.154.114|scanner-201.hk2.censys-scanner.com|7
199.45.154.133|scanner-203.hk2.censys-scanner.com|7
207.90.244.14|-|7
218.92.0.225|-|7
218.92.0.230|-|7
176.124.205.151|-|7
220.95.14.102|-|7
37.58.18.237|-|7
50.66.57.232|S010602070de7ecbf.cg.shawcable.net|7
