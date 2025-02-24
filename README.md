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

Wall of Shame (2025-02-24)
----

|IP|DNS lookup|Number of (black)lists|
|---|---|--:|
37.44.238.88|ssd5-6208.10083|10
80.82.77.33|sky.census.shodan.io|8
34.100.211.26|26.211.100.34.bc.googleusercontent.com|8
92.118.39.71|-|8
92.118.39.74|-|8
193.32.162.131|-|8
193.32.162.132|-|8
193.32.162.134|-|8
193.32.162.137|-|8
195.178.110.76|-|8
218.92.0.114|-|8
218.92.0.223|-|8
218.92.0.233|-|8
218.92.0.236|-|8
71.6.135.131|soda.census.shodan.io|7
80.82.77.139|dojo.census.shodan.io|7
2.57.122.189|-|7
5.101.0.66|-|7
45.144.212.32|-|7
80.82.77.202|rnd.group-ib.com|7
92.118.39.75|-|7
92.255.57.132|-|7
101.66.172.251|-|7
143.244.178.70|-|7
162.142.125.200|-|7
162.142.125.203|-|7
162.142.125.209|scanner-05.ch1.censys-scanner.com|7
162.142.125.213|scanner-05.ch1.censys-scanner.com|7
162.142.125.218|scanner-25.ch1.censys-scanner.com|7
164.92.227.178|-|7
167.94.138.113|scanner-27.ch1.censys-scanner.com|7
167.94.145.97|-|7
167.94.145.98|-|7
167.94.145.100|scanner-01.fr7.censys-scanner.com|7
167.94.145.101|-|7
167.94.145.105|-|7
167.94.145.107|-|7
167.94.145.110|-|7
167.94.146.49|-|7
167.94.146.50|-|7
167.94.146.51|-|7
167.94.146.52|-|7
167.94.146.54|-|7
167.94.146.58|-|7
167.94.146.59|-|7
167.94.146.60|-|7
167.94.146.61|-|7
167.94.146.62|-|7
167.94.146.63|-|7
181.225.140.68|-|7
184.168.122.184|184.122.168.184.host.secureserver.net|7
185.142.236.34|hat.census.shodan.io|7
185.165.191.27|red.census.shodan.io|7
193.32.162.133|-|7
193.32.162.135|-|7
193.32.162.136|-|7
194.0.234.37|-|7
194.0.234.38|-|7
196.251.66.3|-|7
199.45.154.113|scanner-201.hk2.censys-scanner.com|7
199.45.154.126|scanner-201.hk2.censys-scanner.com|7
199.45.154.151|scanner-205.hk2.censys-scanner.com|7
204.76.203.83|hosted-by.pfcloud.io|7
206.168.34.115|unused-space.coop.net|7
207.90.244.3|-|7
218.92.0.112|-|7
218.92.0.198|-|7
218.92.0.216|-|7
218.92.0.217|-|7
218.92.0.218|-|7
218.92.0.219|-|7
218.92.0.220|-|7
218.92.0.221|-|7
218.92.0.222|-|7
218.92.0.225|-|7
218.92.0.226|-|7
218.92.0.227|-|7
218.92.0.228|-|7
218.92.0.229|-|7
218.92.0.230|-|7
218.92.0.231|-|7
218.92.0.232|-|7
218.92.0.235|-|7
218.92.0.237|-|7
190.85.15.251|-|7
209.141.52.5|sabiwasa.tk|7
45.148.10.196|-|7
45.83.3.25|-|7
92.55.190.215|-|7
