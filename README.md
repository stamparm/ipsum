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

Wall of Shame (2025-07-19)
----

|IP|DNS lookup|Number of (black)lists|
|---|---|--:|
176.65.149.226|hosted-by.pfcloud.io|10
179.43.189.98|hostedby.privatelayer.com|10
93.123.109.185|-|9
185.156.73.234|-|9
195.178.110.211|-|9
195.178.110.224|-|9
196.251.83.136|undefined.hostname.localhost|9
45.148.10.240|-|8
78.128.112.74|ip-112-74.4vendeta.com|8
80.94.92.80|-|8
80.94.92.94|-|8
92.118.39.92|-|8
92.118.39.95|-|8
93.123.109.181|-|8
93.123.109.189|-|8
93.174.95.106|battery.census.shodan.io|8
176.65.148.61|hosted-by.pfcloud.io|8
185.93.89.118|-|8
193.32.162.145|-|8
193.32.162.146|-|8
193.32.162.151|-|8
193.32.162.157|-|8
195.178.110.108|-|8
195.178.110.125|-|8
195.178.110.160|-|8
211.253.10.96|-|8
216.10.250.218|server.digitalspoint.com|8
31.15.169.22|31-15-169-22.static.telemach.net|7
36.67.70.198|sehati.tanjabtimkab.go.id|7
45.82.78.254|-|7
45.118.146.109|-|7
51.75.194.10|vps-f8f463b5.vps.ovh.net|7
54.38.190.246|vps-3d2e1516.vps.ovh.net|7
69.63.75.87|-|7
80.82.77.33|sky.census.shodan.io|7
80.82.77.139|dojo.census.shodan.io|7
80.82.77.202|rnd.group-ib.com|7
80.94.92.103|-|7
80.94.95.15|-|7
80.94.95.116|-|7
89.97.218.142|89-97-218-142.ip19.fastwebnet.it|7
93.19.172.217|217.172.19.93.rev.sfr.net|7
104.244.77.50|-|7
106.13.78.99|-|7
107.173.37.111|107-173-37-111-host.colocrossing.com|7
118.179.219.137|-|7
119.187.164.226|-|7
125.17.108.32|server.serverinfo.in.net|7
139.59.64.179|-|7
147.182.194.60|-|7
152.32.158.35|-|7
159.65.146.196|-|7
159.65.196.100|-|7
162.142.125.35|-|7
162.142.125.118|scanner-19.ch1.censys-scanner.com|7
162.142.125.208|scanner-28.ch1.censys-scanner.com|7
164.92.129.65|-|7
167.94.146.53|-|7
167.94.146.55|-|7
167.99.73.157|-|7
167.172.153.88|-|7
179.33.186.151|-|7
185.52.52.186|-|7
185.156.73.233|-|7
185.157.223.126|185-157-223-126-static.glesys.net|7
185.165.191.27|red.census.shodan.io|7
189.217.130.86|customer-189-217-130-86.cablevision.net.mx|7
193.106.245.20|do-fn.rom.net.pl|7
194.0.234.19|-|7
196.251.81.116|undefined.hostname.localhost|7
196.251.85.62|-|7
196.251.88.103|-|7
196.251.115.108|-|7
196.251.116.162|-|7
198.24.79.245|syn-198-024-079-245.biz.spectrum.com|7
206.168.34.72|unused-space.coop.net|7
207.167.66.226|-|7
213.55.85.202|-|7
