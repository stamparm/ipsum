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

Wall of Shame (2025-11-05)
----

|IP|DNS lookup|Number of (black)lists|
|---|---|--:|
80.82.77.33|sky.census.shodan.io|9
80.82.77.139|dojo.census.shodan.io|9
193.32.162.157|-|9
45.81.23.49|-|8
45.159.189.193||8
80.94.93.233|-|8
80.94.95.115|-|8
89.97.218.142|89-97-218-142.ip19.fastwebnet.it|8
89.248.167.131|mason.census.shodan.io|8
92.118.39.95|-|8
93.174.95.106|battery.census.shodan.io|8
161.118.206.188|-|8
162.142.125.35|scanner-201.ch1.censys-scanner.com|8
162.142.125.113|-|8
162.142.125.121|-|8
162.142.125.126|-|8
162.142.125.222|scanner-207.ch1.censys-scanner.com|8
165.154.233.77|-|8
167.94.146.61|-|8
192.210.160.141|192-210-160-141-host.colocrossing.com|8
193.32.162.151|-|8
193.46.255.103|hostingmailto005.statics.servermail.org|8
193.46.255.217|hostingmailto131.statics.servermail.org|8
198.98.53.110|-|8
199.45.155.88|scanner-204.hk2.censys-scanner.com|8
213.55.85.202|-|8
3.130.96.91|scan.cypex.ai|7
3.132.23.201|scan.cypex.ai|7
3.134.148.59|scan.cypex.ai|7
14.116.156.100|-|7
34.59.175.189|189.175.59.34.bc.googleusercontent.com|7
34.175.118.185|185.118.175.34.bc.googleusercontent.com|7
36.67.70.198|sehati.tanjabtimkab.go.id|7
43.252.231.122|-|7
45.121.147.47|-|7
49.64.169.153|-|7
51.75.253.68|vps-94085b09.vps.ovh.net|7
51.158.120.121|121-120-158-51.instances.scw.cloud|7
58.49.113.138|www.safecleen.com|7
66.240.236.109|pdcscan2.scanning.cybcube.com|7
66.240.236.116|ubtuntu20236116.aspadmin.net|7
72.167.52.254|254.52.167.72.host.secureserver.net|7
79.104.0.82|-|7
81.192.46.45|adsl-45-46-192-81.adsl.iam.net.ma|7
81.211.72.167|-|7
82.65.43.136|82-65-43-136.subs.proxad.net|7
85.18.236.229|85-18-236-229.ip.fastwebnet.it|7
86.54.31.38|blue2.census.shodan.io|7
86.54.31.42|green.census.shodan.io|7
91.205.219.185|-|7
92.118.39.62|-|7
92.118.39.92|-|7
95.215.0.144|scan.f6.security|7
103.48.192.48|-|7
103.70.122.208|-|7
103.70.122.209|-|7
103.70.122.210|-|7
103.70.122.213|-|7
103.70.122.214|-|7
103.148.100.146|-|7
103.246.42.72|rw-0072-42.246.103.rcil.gov.in|7
115.91.91.182|-|7
119.96.174.235|-|7
121.224.115.232|-|7
122.155.0.205|www.thalaychupsorn.go.th|7
123.139.218.0|-|7
125.21.59.218|-|7
125.132.34.65|-|7
130.185.118.124|vmi2879661.contaboserver.net|7
136.228.161.66|-|7
137.184.202.107|nauru.production|7
138.97.13.19|138-97-13-19.redebrtelecom.com.br|7
139.59.64.179|-|7
147.182.194.60|-|7
147.185.132.55|-|7
150.223.20.12|-|7
160.174.129.232|-|7
162.142.125.37|scanner-201.ch1.censys-scanner.com|7
162.142.125.114|-|7
162.142.125.116|-|7
162.142.125.117|-|7
162.142.125.200|scanner-202.ch1.censys-scanner.com|7
162.142.125.204|scanner-202.ch1.censys-scanner.com|7
162.142.125.213|scanner-207.ch1.censys-scanner.com|7
162.142.125.216|scanner-207.ch1.censys-scanner.com|7
162.142.125.218|scanner-207.ch1.censys-scanner.com|7
165.154.163.10|-|7
167.94.138.166|-|7
167.94.146.49|-|7
167.94.146.51|-|7
167.94.146.55|-|7
167.94.146.56|-|7
167.94.146.57|-|7
167.94.146.59|-|7
167.94.146.63|-|7
176.32.195.85|scan.f6.security|7
176.65.132.139|-|7
176.213.141.182|176x213x141x182.dynamic.rostov.ertelecom.ru|7
176.235.182.73|-|7
179.33.186.151|-|7
181.49.50.6|-|7
182.93.50.90|n18293z50l90.static.ctmip.net|7
185.141.132.26|-|7
185.156.73.233|-|7
185.228.135.173|-|7
193.32.162.145|-|7
193.32.162.146|-|7
193.46.255.20|hostingmailto112.statics.servermail.org|7
193.46.255.99|hostingmailto251.statics.servermail.org|7
193.46.255.159|hostingmailto066.statics.servermail.org|7
193.46.255.244|hostingmailto161.statics.servermail.org|7
196.251.88.103|-|7
198.12.86.4|198-12-86-4-host.colocrossing.com|7
198.46.207.98|198-46-207-98-host.colocrossing.com|7
199.45.155.76|scanner-202.hk2.censys-scanner.com|7
202.51.214.99|-|7
203.0.104.170|-|7
203.113.174.95|-|7
203.190.53.154|-|7
206.168.34.41|unused-space.coop.net|7
206.168.34.45|unused-space.coop.net|7
206.168.34.119|unused-space.coop.net|7
206.168.34.122|unused-space.coop.net|7
206.168.34.192|unused-space.coop.net|7
212.233.136.201|212-233-136-201.optisprint.net|7
216.10.250.218|server.digitalspoint.com|7
219.150.93.157|-|7
220.80.223.144|-|7
221.229.218.50|-|7
