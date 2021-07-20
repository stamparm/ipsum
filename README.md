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
apt -qq install iptables ipset
ipset -q flush ipsum
ipset -q create ipsum hash:net
for ip in $(curl --compressed https://raw.githubusercontent.com/stamparm/ipsum/master/ipsum.txt 2>/dev/null | grep -v "#" | grep -v -E "\s[1-2]$" | cut -f 1); do ipset add ipsum $ip; done
iptables -I INPUT -m set --match-set ipsum src -j DROP
```

In directory [levels](levels) you can find preprocessed raw IP lists based on number of blacklist occurrences (e.g. [levels/3.txt](levels/3.txt) holds IP addresses that can be found on 3 or more blacklists).

Wall of Shame (2021-07-20)
----

|IP|DNS lookup|Number of (black)lists|
|---|---|--:|
171.25.193.25|tor-exit5-readme.dfri.se|10
209.141.62.234|-|9
171.25.193.77|tor-exit1-readme.dfri.se|9
141.98.10.203|-|9
167.99.34.181|-|9
199.195.248.154|-|9
205.185.116.44|smtp2.einfachdoktor.eu|8
205.185.119.90|email-poczta.pl|8
209.141.50.25|peach.snapnode.com|8
141.98.10.56|-|8
104.244.78.233|This-is-a-tor-exit.ignorelist.com|8
107.189.1.161|-|8
162.247.72.199|jaffer.tor-exit.calyxinstitute.org|8
209.141.42.147|-|8
166.70.207.2|this.is.a.tor.node.xmission.com|8
205.185.125.109|-|8
143.244.169.230|-|8
107.189.3.151|-|8
107.189.11.246|mta2.ohne-rezept-kaufen123.shop|8
107.189.30.250|-|8
209.141.54.66|-|8
141.98.10.29|-|8
107.189.1.180|-|8
171.25.193.78|tor-exit4-readme.dfri.se|8
185.220.101.1|-|8
104.244.78.182|-|8
205.185.127.25|serveroperations.com|8
141.98.10.179|er.includeswitche.com|8
107.189.3.138|-|8
205.185.125.24|-|8
45.129.56.200|-|8
37.0.11.249|-|8
141.98.10.27|-|8
161.35.80.11|-|8
134.122.63.163|-|8
62.210.105.116|62-210-105-116.rev.poneytelecom.eu|8
205.185.119.216|-|8
209.141.35.160|mail.g3nius.org|8
80.67.172.162|algrothendieck.nos-oignons.net|8
199.19.226.109|-|7
61.177.173.11|-|7
205.185.126.160|-|7
222.187.232.205|-|7
205.185.117.79|-|7
221.131.165.56|-|7
209.141.60.49|-|7
107.189.11.254|-|7
205.185.122.83|youtianxia23.sendingmail.club|7
185.107.47.171|tor-exit.r2.darknet.dev|7
205.185.125.179|-|7
178.20.55.16|marcuse-1.nos-oignons.net|7
74.201.28.120|einem.impactflower.com|7
205.185.127.28|area66.mine.nu|7
94.230.208.147|tor3e1.digitale-gesellschaft.ch|7
222.187.239.109|-|7
185.130.44.108|tor-exit-se1.privex.cc|7
182.73.123.118|-|7
107.189.2.114|-|7
103.131.52.4|-|7
209.141.50.121|mta4.blmcola.de|7
222.186.42.7|-|7
167.86.94.107|master-of-disaster.tor-exit.laarnes.nl|7
107.189.1.174|-|7
107.189.3.77|-|7
221.181.185.159|-|7
221.181.185.153|-|7
45.153.160.139|-|7
45.153.160.138|-|7
222.186.42.13|-|7
107.189.1.218|-|7
45.141.159.63|-|7
109.104.151.106|-|7
205.185.117.109|rufy.bbqd.org|7
162.247.74.206|rosaluxemburg.tor-exit.calyxinstitute.org|7
89.234.157.254|marylou.nos-oignons.net|7
221.181.185.198|-|7
36.112.171.51|-|7
222.186.30.112|-|7
221.181.185.19|-|7
209.141.61.31|icefloe.qeast.net|7
185.220.101.4|-|7
185.220.101.3|-|7
209.141.32.39|-|7
209.141.52.113|-|7
107.189.1.107|-|7
176.10.104.240|tor1e1.digitale-gesellschaft.ch|7
62.210.37.82|62-210-37-82.rev.poneytelecom.eu|7
222.186.42.213|-|7
104.244.78.183|-|7
222.186.42.137|-|7
179.43.175.125|-|7
185.220.101.22|-|7
143.110.221.59|-|7
221.181.185.220|-|7
104.248.20.236|-|7
198.144.121.93|-|7
77.247.181.165|politkovskaja.torservers.net|7
222.186.180.130|-|7
185.220.103.7|anatkamm.tor-exit.calyxinstitute.org|7
45.153.160.140|-|7
66.230.230.230|-|7
171.25.193.20|tor-exit0-readme.dfri.se|7
176.10.99.200|accessnow.org|7
222.187.238.136|-|7
209.141.54.8|-|7
64.113.32.29|tor.t-3.net|7
199.195.250.77|ny1.exit.tor.alkyl.eu.org|7
222.186.30.76|-|7
205.185.126.8|-|7
180.76.136.108|-|7
199.19.226.145|lv01.0wn.net|7
107.189.3.247|-|7
221.181.185.135|-|7
209.141.58.69|-|7
205.185.114.127|-|7
