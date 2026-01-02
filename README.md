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
If you want to try it with `nftables`, you can do the following:

```
sudo su
nft flush set inet filter ipsum
nft add set inet filter ipsum '{ type ipv4_addr; }'
for ip in $(curl https://raw.githubusercontent.com/stamparm/ipsum/master/ipsum.txt 2>/dev/null | grep -v "#" | grep -v -E "\s[1-2]$" | cut -f 1); do nft add element inet filter ipsum { $ip }; done
nft delete rule inet filter input handle $(nft -a list chain inet filter input | grep 'ip saddr @ipsum drop' | awk '{print $NF}') 2>/dev/null
nft add rule inet filter input ip saddr @ipsum drop
```

In directory [levels](levels) you can find preprocessed raw IP lists based on number of blacklist occurrences (e.g. [levels/3.txt](levels/3.txt) holds IP addresses that can be found on 3 or more blacklists).

Wall of Shame (2026-01-02)
----

|IP|DNS lookup|Number of (black)lists|
|---|---|--:|
46.151.182.230|-|10
45.93.168.13|45-93-168-13.digiturunc.com|9
45.148.10.121|-|9
82.23.183.89|ititanhosting.com|9
101.36.107.228|-|9
163.5.148.15|-|9
2.57.121.25|hosting25.tronicsat.com|8
2.57.121.112|dns112.personaliseplus.com|8
3.137.73.221|scan.cypex.ai|8
43.134.184.20|-|8
66.132.153.118|-|8
66.132.153.121|-|8
66.132.153.125|-|8
66.132.153.128|scanner-001.ch1.censys-scanner.com|8
71.6.135.131|soda.census.shodan.io|8
80.82.77.33|sky.census.shodan.io|8
82.67.140.251|xbn44-1_migr-82-67-140-251.fbx.proxad.net|8
88.151.33.203|-|8
93.174.95.106|battery.census.shodan.io|8
101.36.104.242|-|8
103.232.121.71|nick8472839|8
118.69.199.170|-|8
150.241.106.136|-|8
162.142.125.115|-|8
162.142.125.195|scanner-202.ch1.censys-scanner.com|8
162.142.125.213|scanner-207.ch1.censys-scanner.com|8
167.94.146.59|-|8
167.94.146.63|-|8
198.98.53.110|-|8
213.209.159.159|-|8
3.132.23.201|scan.cypex.ai|7
3.134.148.59|scan.cypex.ai|7
5.187.97.40|-|7
14.63.196.175|-|7
14.98.244.193|-|7
14.103.92.40|-|7
27.111.32.174|-|7
35.237.94.18|18.94.237.35.bc.googleusercontent.com|7
36.66.16.233|-|7
37.120.213.13|-|7
45.79.181.104|monaco.scan.bufferover.run|7
45.79.181.223|malta.scan.bufferover.run|7
45.81.23.49|-|7
45.91.64.6|-|7
45.91.64.8|-|7
45.119.81.249|-|7
45.120.216.232|-|7
46.151.182.229|-|7
51.158.120.121|121-120-158-51.instances.scw.cloud|7
54.38.190.246|vps-3d2e1516.vps.ovh.net|7
61.245.11.87|-|7
66.132.153.114|-|7
66.132.153.115|-|7
66.132.153.126|-|7
66.132.153.129|scanner-001.ch1.censys-scanner.com|7
66.132.153.130|scanner-001.ch1.censys-scanner.com|7
66.132.153.132|scanner-001.ch1.censys-scanner.com|7
66.132.153.139|scanner-001.ch1.censys-scanner.com|7
66.132.153.143|scanner-001.ch1.censys-scanner.com|7
66.175.213.4|vilnius.scan.bufferover.run|7
66.240.192.138|census8.shodan.io|7
66.240.236.119|census6.shodan.io|7
68.183.149.224|-|7
71.6.199.23|einstein.census.shodan.io|7
78.109.200.147|-|7
79.104.0.82|-|7
80.82.77.139|dojo.census.shodan.io|7
80.94.92.166|-|7
80.94.92.182|-|7
80.94.92.186|-|7
80.94.93.233|-|7
80.94.95.116|-|7
80.253.31.232|-|7
81.211.72.167|-|7
82.23.183.88|ititanhosting.com|7
83.168.107.220|hosted-by.SkillHost.PL|7
88.147.30.59|88-147-30-59.static.eolo.it|7
89.248.167.131|mason.census.shodan.io|7
91.224.92.14|srv-91-224-92-14.serveroffer.net|7
94.26.106.81|-|7
95.167.225.76|-|7
96.44.158.206|-|7
101.126.54.66|-|7
102.208.184.2|-|7
103.75.183.76|-|7
103.149.27.179|-|7
103.214.112.84|-|7
103.252.73.37|-|7
106.38.205.224|-|7
114.219.157.97|-|7
117.6.44.221|-|7
120.92.33.108|-|7
125.21.59.218|-|7
128.1.47.28|-|7
128.199.157.145|-|7
130.12.180.18|-|7
148.153.189.62|-|7
149.88.74.74|-|7
151.80.61.151|vps-5d95afd4.vps.ovh.net|7
161.18.228.75|-|7
162.142.125.41|scanner-201.ch1.censys-scanner.com|7
162.142.125.43|scanner-201.ch1.censys-scanner.com|7
162.142.125.46|scanner-201.ch1.censys-scanner.com|7
162.142.125.113|-|7
162.142.125.119|-|7
162.142.125.122|-|7
162.142.125.123|-|7
162.142.125.124|-|7
162.142.125.125|-|7
162.142.125.196|scanner-202.ch1.censys-scanner.com|7
162.142.125.201|scanner-202.ch1.censys-scanner.com|7
162.142.125.204|scanner-202.ch1.censys-scanner.com|7
162.142.125.208|scanner-207.ch1.censys-scanner.com|7
165.154.1.18|-|7
167.94.146.50|-|7
167.94.146.51|-|7
167.94.146.52|-|7
167.94.146.53|-|7
167.94.146.57|-|7
167.94.146.58|-|7
167.94.146.62|-|7
168.167.228.74|-|7
172.105.128.11|oslo.scan.bufferover.run|7
175.200.104.40|-|7
176.32.195.85|scan.f6.security|7
178.17.58.173|-|7
178.62.25.91|-|7
178.251.140.3|b32-mgmt-gw.dssv.ru|7
179.33.186.151|-|7
181.49.50.6|-|7
183.82.126.193|183.82.126.193.actcorp.in|7
185.156.73.233|-|7
185.213.165.65|static.65.165.213.185.clients.irandns.com|7
186.118.142.216|-|7
187.16.96.250|mvx-187-16-96-250.mundivox.com|7
187.210.77.100|customer-187-210-77-100.uninet-ide.com.mx|7
193.46.255.7|hostingmailto221.statics.servermail.org|7
193.46.255.99|hostingmailto251.statics.servermail.org|7
193.46.255.103|hostingmailto005.statics.servermail.org|7
193.46.255.159|hostingmailto066.statics.servermail.org|7
197.5.145.8|-|7
197.5.145.102|-|7
199.45.154.142|scanner-203.hk2.censys-scanner.com|7
199.45.155.97|scanner-206.hk2.censys-scanner.com|7
200.118.99.170|dynamic-ip-cr20011899170.cable.net.co|7
202.51.214.99|-|7
206.168.34.207|unused-space.coop.net|7
216.180.246.234|crawler234.deepfield.net|7
217.119.129.100||7
217.154.38.135|-|7
220.80.223.144|-|7
220.247.223.56|56.sta.idc-2.slt.lk|7
222.107.156.227|-|7
223.197.186.7|223-197-186-7.static.imsbiz.com|7
