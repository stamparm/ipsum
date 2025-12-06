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

Wall of Shame (2025-12-06)
----

|IP|DNS lookup|Number of (black)lists|
|---|---|--:|
61.245.11.87|-|11
2.57.121.112|dns112.personaliseplus.com|10
80.82.77.33|sky.census.shodan.io|9
80.94.92.182|-|9
93.174.95.106|battery.census.shodan.io|9
114.111.54.188|-|9
129.45.84.93|host-93.84.45.129.djezzycloud.dz|9
150.241.115.127|-|9
27.111.32.174|-|8
62.60.131.157|-|8
71.6.135.131|soda.census.shodan.io|8
80.82.77.139|dojo.census.shodan.io|8
80.94.92.165|-|8
80.94.92.166|-|8
80.94.92.184|-|8
80.94.92.186|-|8
89.248.167.131|mason.census.shodan.io|8
92.118.39.92|-|8
103.56.115.6|-|8
143.20.185.79|-|8
167.94.146.63|-|8
167.179.81.184|167.179.81.184.vultrusercontent.com|8
170.238.160.191|-|8
173.224.125.59|lewis1019.startdedicated.com|8
193.46.255.20|hostingmailto112.statics.servermail.org|8
193.46.255.33|hostingmailto181.statics.servermail.org|8
206.168.34.61|unused-space.coop.net|8
206.168.34.210|unused-space.coop.net|8
2.57.121.25|hosting25.tronicsat.com|7
3.130.96.91|scan.cypex.ai|7
3.131.215.38|ec2-3-131-215-38.us-east-2.compute.amazonaws.com|7
3.137.73.221|scan.cypex.ai|7
5.101.64.6|scan.f6.security|7
5.187.97.40|-|7
14.63.196.175|-|7
34.175.118.185|185.118.175.34.bc.googleusercontent.com|7
35.240.174.82|82.174.240.35.bc.googleusercontent.com|7
36.50.23.38|-|7
36.64.68.99|-|7
36.67.70.198|sehati.tanjabtimkab.go.id|7
41.59.86.232|232.86-59-41.static-zone.ttcldata.net|7
45.121.147.47|-|7
45.232.73.84|-|7
50.6.229.250|50-6-229-250.unifiedlayer.com|7
51.158.120.121|121-120-158-51.instances.scw.cloud|7
57.128.190.44|vps-b45b3ce9.vps.ovh.net|7
58.222.244.226|-|7
64.62.197.137|-|7
64.227.97.118|-|7
68.183.88.186|-|7
71.6.199.23|einstein.census.shodan.io|7
78.128.112.74|ip-112-74.4vendeta.com|7
79.104.0.82|-|7
80.94.92.164|-|7
80.94.92.169|-|7
80.94.93.119|-|7
83.235.16.111|goevthes.static.otenet.gr|7
86.54.31.34|wine.census.shodan.io|7
86.54.31.38|blue2.census.shodan.io|7
86.54.31.42|green.census.shodan.io|7
87.120.191.21|-|7
92.118.39.95|-|7
94.254.0.234|h-94-254-0-234.na.cust.bahnhof.se|7
95.58.255.251|95.58.255.251.static.telecom.kz|7
102.88.137.80|-|7
102.88.137.213|-|7
103.48.192.48|-|7
103.120.227.88|-|7
103.163.119.125|-|7
103.182.132.154|-|7
103.210.21.20|-|7
103.237.144.204|-|7
106.75.239.166|-|7
115.91.91.182|-|7
118.122.147.195|-|7
121.224.115.232|-|7
123.58.212.64|-|7
125.21.59.218|-|7
136.228.161.66|-|7
136.232.11.10|-|7
139.9.25.4|ecs-139-9-25-4.compute.hwclouds-dns.com|7
142.248.29.44|-|7
144.31.19.70|224847.senko.network|7
147.182.194.60|-|7
150.107.38.251|-|7
156.245.248.226|-|7
161.18.228.75|-|7
161.49.89.39|161.49.89.39.convergeict.com|7
161.118.129.223|-|7
162.142.125.36|scanner-201.ch1.censys-scanner.com|7
162.142.125.40|scanner-201.ch1.censys-scanner.com|7
162.142.125.42|scanner-201.ch1.censys-scanner.com|7
162.142.125.44|scanner-201.ch1.censys-scanner.com|7
162.142.125.47|scanner-201.ch1.censys-scanner.com|7
162.142.125.112|-|7
162.142.125.116|-|7
162.142.125.118|-|7
162.142.125.121|-|7
162.142.125.122|-|7
162.142.125.123|-|7
162.142.125.124|-|7
162.142.125.192|scanner-202.ch1.censys-scanner.com|7
162.142.125.203|scanner-202.ch1.censys-scanner.com|7
162.142.125.206|scanner-202.ch1.censys-scanner.com|7
162.142.125.207|scanner-202.ch1.censys-scanner.com|7
162.142.125.208|scanner-207.ch1.censys-scanner.com|7
162.142.125.212|scanner-207.ch1.censys-scanner.com|7
162.142.125.222|scanner-207.ch1.censys-scanner.com|7
162.216.150.64|64.150.216.162.bc.googleusercontent.com|7
163.5.148.15|-|7
165.154.233.77|-|7
167.94.138.32|scanner-06.ch1.censys-scanner.com|7
167.94.138.48|scanner-07.ch1.censys-scanner.com|7
167.94.138.60|scanner-07.ch1.censys-scanner.com|7
167.94.138.119|scanner-27.ch1.censys-scanner.com|7
167.94.138.173|-|7
167.94.138.177|-|7
167.94.138.179|-|7
167.94.146.48|-|7
167.94.146.49|-|7
167.94.146.50|-|7
167.94.146.52|-|7
167.94.146.56|-|7
167.94.146.57|-|7
167.94.146.61|-|7
167.94.146.62|-|7
171.104.143.176|-|7
172.105.128.12|reykjavik.scan.bufferover.run|7
175.107.32.186|-|7
179.33.186.151|-|7
182.93.7.194|n18293z7l194.static.ctmip.net|7
185.213.165.65|static.65.165.213.185.clients.irandns.com|7
185.228.135.173|-|7
185.242.226.19|security.criminalip.com|7
185.246.130.20|-|7
186.56.11.17|-|7
186.118.142.216|-|7
187.210.77.100|customer-187-210-77-100.uninet-ide.com.mx|7
189.112.0.11|189-112-000-011.static.ctbctelecom.com.br|7
192.210.160.141|192-210-160-141-host.colocrossing.com|7
193.32.162.157|-|7
193.46.255.7|hostingmailto221.statics.servermail.org|7
193.46.255.99|hostingmailto251.statics.servermail.org|7
193.106.245.20|do-fn.rom.net.pl|7
193.142.147.209|-|7
196.251.100.74|-|7
199.45.155.71|scanner-202.hk2.censys-scanner.com|7
200.118.99.170|dynamic-ip-cr20011899170.cable.net.co|7
202.157.177.33|mail.simaster-brebeskab.id|7
203.0.104.170|-|7
203.150.107.244|244.107.150.203.sta.inet.co.th|7
206.168.34.32|unused-space.coop.net|7
206.168.34.34|unused-space.coop.net|7
206.168.34.36|unused-space.coop.net|7
206.168.34.39|unused-space.coop.net|7
206.168.34.42|unused-space.coop.net|7
206.168.34.44|unused-space.coop.net|7
206.168.34.123|unused-space.coop.net|7
206.168.34.200|unused-space.coop.net|7
206.168.34.203|unused-space.coop.net|7
206.168.34.215|unused-space.coop.net|7
206.168.34.223|unused-space.coop.net|7
212.83.163.118|212-83-163-118.rev.poneytelecom.eu|7
213.55.85.202|-|7
221.156.126.1|-|7
222.108.100.117|-|7
