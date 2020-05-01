![Logo](https://i.imgur.com/PyKLAe7.png)

[![License](https://img.shields.io/badge/license-Public_domain-red.svg)](https://wiki.creativecommons.org/wiki/Public_domain)

About
----

**IPsum** is a threat intelligence feed based on 30+ different publicly available [lists](https://github.com/stamparm/maltrail) of suspicious and/or malicious IP addresses. All lists are automatically retrieved and parsed on a daily (24h) basis and the final result is pushed to this repository. List is made of IP addresses together with a total number of (black)list occurrence (for each). Greater the number, lesser the chance of false positive detection and/or dropping in (inbound) monitored traffic. Also, list is sorted from most (problematic) to least occurent IP addresses.

As an example, to get a fresh and ready-to-deploy auto-ban list of "bad IPs" that appear on at least 3 (black)lists you can run:

```
curl --compressed https://media.githubusercontent.com/media/stamparm/ipsum/master/ipsum.txt 2>/dev/null | grep -v "#" | grep -v -E "\s[1-2]$" | cut -f 1
```

If you want to try it with `ipset`, you can do the following:

```
sudo su
apt-get -qq install iptables ipset
ipset -q flush ipsum
ipset -q create ipsum hash:net
for ip in $(curl --compressed https://media.githubusercontent.com/media/stamparm/ipsum/master/ipsum.txt 2>/dev/null | grep -v "#" | grep -v -E "\s[1-2]$" | cut -f 1); do ipset add ipsum $ip; done
iptables -I INPUT -m set --match-set ipsum src -j DROP
```

In directory [levels](levels) you can find preprocessed raw IP lists based on number of blacklist occurrences (e.g. [levels/3.txt](levels/3.txt) holds IP addresses that can be found on 3 or more blacklists).

Wall of shame (2020-05-01)
----

|IP|DNS lookup|Number of (black)lists|
|---|---|--:|
45.95.168.131|maxko-hosting.com|9
185.220.100.253|tor-exit-2.zbau.f3netze.de|9
62.102.148.68|-|9
89.234.157.254|marylou.nos-oignons.net|8
27.78.14.83|localhost|8
103.79.141.156|-|8
93.186.170.7|-|8
192.42.116.16|tor-exit.hartvoorinternetvrijheid.nl|8
92.63.194.104|-|8
185.220.102.8|-|8
51.15.106.64|64-106-15-51.rev.cloud.scaleway.com|8
77.247.181.162|chomsky.torservers.net|8
144.217.255.89|ns542132.ip-144-217-255.net|8
51.75.144.43|ns3129517.ip-51-75-144.eu|8
185.220.101.197|-|8
185.220.100.247|tor-exit-8.zbau.f3netze.de|8
185.220.100.243|tor-exit-16.zbau.f3netze.de|8
185.220.100.241|tor-exit-14.zbau.f3netze.de|8
195.206.105.217|zrh-exit.privateinternetaccess.com|8
5.182.211.181|-|8
62.210.105.116|62-210-105-116.rev.poneytelecom.eu|8
51.158.111.157|157-111-158-51.rev.cloud.scaleway.com|8
