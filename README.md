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

Wall of Shame (2024-11-02)
----

|IP|DNS lookup|Number of (black)lists|
|---|---|--:|
45.140.192.46|-|9
47.250.122.133|-|9
80.64.30.138|-|9
80.64.30.139|-|9
83.222.191.62|-|9
94.159.104.177|yvk.ua|9
129.146.26.210|-|9
152.32.158.35|-|9
195.178.110.6|-|9
195.178.110.112|-|9
203.81.86.34|-|9
45.148.10.240|-|8
45.207.201.135|-|8
47.84.32.175|-|8
60.191.23.20|-|8
79.137.206.88|incredible-basketball.aeza.network|8
80.82.77.33|sky.census.shodan.io|8
91.92.120.31|-|8
93.174.95.106|battery.census.shodan.io|8
103.77.214.148|-|8
103.252.88.6|rw-hosting.fr|8
109.120.176.11|AKoryakin.aeza.network|8
128.14.129.10|-|8
146.190.247.230|-|8
164.92.86.73|-|8
178.128.161.183|-|8
185.26.238.32|-|8
194.38.147.226|-|8
194.169.175.37|-|8
195.178.110.114|-|8
213.58.136.131|-|8
218.92.0.217|-|8
218.92.0.218|-|8
218.92.0.220|-|8
218.92.0.222|-|8
218.92.0.226|-|8
218.92.0.227|-|8
218.92.0.228|-|8
218.92.0.230|-|8
218.92.0.231|-|8
218.92.0.232|-|8
218.92.0.235|-|8
218.92.0.236|-|8
5.42.84.98|peppy-calculator.aeza.network|7
8.137.111.174|-|7
8.154.32.31|-|7
8.213.33.170|-|7
8.220.135.229|-|7
23.249.28.102|-|7
45.66.228.237|-|7
45.148.10.119|-|7
45.148.10.120|-|7
47.97.2.151|-|7
47.236.61.91|-|7
50.192.223.205|-|7
51.195.118.78|vps-5d3321c5.vps.ovh.net|7
54.37.207.41|ip41.ip-54-37-207.eu|7
64.23.156.175|-|7
64.23.244.21|-|7
64.226.117.7|-|7
77.221.156.122|many-sky.aeza.network|7
80.253.31.232|-|7
82.200.65.218|gw-bell-xen.ll-nsk.zsttk.ru|7
83.229.126.78|-|7
92.255.85.107|-|7
94.254.0.234|h-94-254-0-234.na.cust.bahnhof.se|7
103.77.214.55|-|7
103.90.67.83|ip4-103.90.67.83.racemedia.co.id|7
103.91.136.18|-|7
103.127.196.172|-|7
103.142.86.221|-|7
106.14.168.126|-|7
109.120.138.140|marked-rod.aeza.network|7
117.53.144.220|-|7
122.155.0.205|www.phatan.go.th|7
129.146.37.6|-|7
142.93.74.145|-|7
144.126.229.46|-|7
152.228.128.55|vps-54dc440b.vps.ovh.net|7
154.213.187.108|-|7
163.179.62.66|-|7
167.99.67.30|-|7
167.99.74.130|-|7
172.104.4.17|172-104-4-17.ip.linodeusercontent.com|7
178.20.55.16|marcuse.nos-oignons.net|7
182.229.10.141|-|7
183.105.155.146|-|7
185.129.62.62|tor01.zencurity.com|7
185.220.101.4|berlin01.tor-exit.artikel10.org|7
190.128.230.98|pool-98-230-128-190.telecel.com.py|7
192.42.116.184|32.tor-exit.nothingtohide.nl|7
192.42.116.208|11.tor-exit.nothingtohide.nl|7
192.42.116.213|16.tor-exit.nothingtohide.nl|7
192.42.116.214|17.tor-exit.nothingtohide.nl|7
192.42.116.215|18.tor-exit.nothingtohide.nl|7
192.42.116.218|44.tor-exit.nothingtohide.nl|7
193.123.240.63|-|7
194.169.175.38|-|7
194.238.27.87|vmi2220312.contaboserver.net|7
195.133.2.209|imminent-ocean.aeza.network|7
195.178.110.67|-|7
195.245.191.244|-|7
199.45.154.125|scanner-201.hk2.censys-scanner.com|7
199.45.154.127|scanner-201.hk2.censys-scanner.com|7
199.195.248.117|abelha.shop|7
202.125.139.10|webconcepts.lhr63d1.pie.net.pk|7
206.168.34.216|unused-space.coop.net|7
206.189.22.108|-|7
207.90.244.6|-|7
211.253.10.96|-|7
213.55.85.202|-|7
213.58.129.113|-|7
213.109.202.127|-|7
218.92.0.219|-|7
218.92.0.221|-|7
218.92.0.223|-|7
218.92.0.237|-|7
220.80.223.144|-|7
