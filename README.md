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

Wall of Shame (2025-11-16)
----

|IP|DNS lookup|Number of (black)lists|
|---|---|--:|
2.57.121.112|dns112.personaliseplus.com|10
80.82.77.139|dojo.census.shodan.io|9
80.94.95.115|-|9
92.118.39.92|-|9
93.174.95.106|battery.census.shodan.io|9
161.118.206.188|-|9
167.94.146.49|-|9
167.94.146.50|-|9
3.131.215.38|ec2-3-131-215-38.us-east-2.compute.amazonaws.com|8
3.132.23.201|scan.cypex.ai|8
71.6.146.186|inspire.census.shodan.io|8
80.94.95.116|-|8
82.158.88.158|-|8
86.54.31.34|wine.census.shodan.io|8
89.97.218.142|89-97-218-142.ip19.fastwebnet.it|8
103.56.115.6|-|8
103.143.11.97|-|8
114.111.54.188|-|8
152.67.60.131|-|8
162.142.125.112|-|8
162.142.125.210|scanner-207.ch1.censys-scanner.com|8
167.94.146.52|-|8
167.94.146.58|-|8
167.94.146.62|-|8
168.107.23.247|-|8
176.32.195.85|scan.f6.security|8
185.156.73.233|-|8
193.32.162.146|-|8
193.32.162.157|-|8
213.55.85.202|-|8
220.80.223.144|-|8
223.16.233.103|103-233-16-223-on-nets.com|8
2.57.121.25|hosting25.tronicsat.com|7
2.59.22.234|red3.census.shodan.io|7
3.130.96.91|scan.cypex.ai|7
3.137.73.221|scan.cypex.ai|7
5.101.64.6|scan.f6.security|7
8.154.1.148|-|7
14.139.216.56|-|7
20.171.8.42|azpdwslg2q69.stretchoid.com|7
35.203.210.169|169.210.203.35.bc.googleusercontent.com|7
35.203.211.64|64.211.203.35.bc.googleusercontent.com|7
35.237.94.18|18.94.237.35.bc.googleusercontent.com|7
36.67.70.198|sehati.tanjabtimkab.go.id|7
45.43.33.210|colby.probe.onyphe.net|7
45.120.216.232|-|7
45.232.73.84|-|7
46.161.50.108|scan.f6.security|7
47.236.76.100|-|7
50.223.176.171|-|7
51.75.253.68|vps-94085b09.vps.ovh.net|7
58.222.244.226|-|7
59.12.160.91|-|7
61.155.106.101|-|7
62.60.131.157|-|7
62.193.106.227|-|7
66.132.153.112|-|7
66.132.153.113|-|7
66.132.153.116|-|7
66.132.153.119|-|7
66.132.153.122|-|7
66.132.153.125|-|7
66.132.153.131|scanner-001.ch1.censys-scanner.com|7
66.132.153.137|scanner-001.ch1.censys-scanner.com|7
66.132.153.138|scanner-001.ch1.censys-scanner.com|7
66.132.153.139|scanner-001.ch1.censys-scanner.com|7
66.132.153.140|scanner-001.ch1.censys-scanner.com|7
66.132.153.141|scanner-001.ch1.censys-scanner.com|7
66.132.153.142|scanner-001.ch1.censys-scanner.com|7
66.132.153.143|scanner-001.ch1.censys-scanner.com|7
66.240.236.119|census6.shodan.io|7
68.183.88.186|-|7
71.6.134.232|-|7
71.6.135.131|soda.census.shodan.io|7
71.6.165.200|census12.shodan.io|7
71.6.199.23|einstein.census.shodan.io|7
71.6.199.87|-|7
78.159.130.8|scan.kolovrat.net|7
80.82.77.33|sky.census.shodan.io|7
80.253.31.232|-|7
81.192.46.45|adsl-45-46-192-81.adsl.iam.net.ma|7
86.54.31.32|hat.census.shodan.io|7
86.54.31.40|blue.census.shodan.io|7
86.54.31.42|green.census.shodan.io|7
89.248.167.131|mason.census.shodan.io|7
91.170.247.160|91-170-247-160.subs.proxad.net|7
92.27.101.99|host-92-27-101-99.static.as13285.net|7
94.102.49.193|cloud.census.shodan.io|7
94.254.0.234|h-94-254-0-234.na.cust.bahnhof.se|7
95.167.225.76|-|7
95.182.100.121|-|7
101.47.5.97|-|7
102.88.137.80|-|7
103.144.87.192|probation-proxy|7
103.182.132.154|-|7
104.198.43.206|206.43.198.104.bc.googleusercontent.com|7
107.170.232.33|-|7
112.196.70.142|-|7
113.193.234.210|-|7
119.96.174.235|-|7
122.165.60.231|abts-tn-static-231.60.165.122.airtelbroadband.in|7
123.253.22.30|-|7
136.26.36.177|136-26-36-177.cab.webpass.net|7
138.204.127.54|-|7
147.182.194.60|-|7
147.185.132.61|-|7
147.185.132.76|-|7
147.185.132.115|-|7
147.185.132.132|-|7
150.223.20.12|-|7
154.16.10.170|-|7
160.251.121.70|works.ssc-gr.info|7
162.142.125.32|scanner-201.ch1.censys-scanner.com|7
162.142.125.34|scanner-201.ch1.censys-scanner.com|7
162.142.125.35|scanner-201.ch1.censys-scanner.com|7
162.142.125.37|scanner-201.ch1.censys-scanner.com|7
162.142.125.47|scanner-201.ch1.censys-scanner.com|7
162.142.125.113|-|7
162.142.125.116|-|7
162.142.125.118|-|7
162.142.125.120|-|7
162.142.125.121|-|7
162.142.125.125|-|7
162.142.125.127|-|7
162.142.125.194|scanner-202.ch1.censys-scanner.com|7
162.142.125.197|scanner-202.ch1.censys-scanner.com|7
162.142.125.208|scanner-207.ch1.censys-scanner.com|7
162.142.125.209|scanner-207.ch1.censys-scanner.com|7
162.142.125.213|scanner-207.ch1.censys-scanner.com|7
162.142.125.214|scanner-207.ch1.censys-scanner.com|7
162.142.125.215|scanner-207.ch1.censys-scanner.com|7
162.142.125.220|scanner-207.ch1.censys-scanner.com|7
162.216.149.71|71.149.216.162.bc.googleusercontent.com|7
162.216.149.82|82.149.216.162.bc.googleusercontent.com|7
162.216.149.208|208.149.216.162.bc.googleusercontent.com|7
162.216.150.87|87.150.216.162.bc.googleusercontent.com|7
162.216.150.227|227.150.216.162.bc.googleusercontent.com|7
164.177.31.66|static-csq-cds-031066.business.bouyguestelecom.com|7
165.154.233.77|-|7
167.94.138.32|scanner-06.ch1.censys-scanner.com|7
167.94.138.53|scanner-07.ch1.censys-scanner.com|7
167.94.138.59|scanner-07.ch1.censys-scanner.com|7
167.94.138.60|scanner-07.ch1.censys-scanner.com|7
167.94.138.173|-|7
167.94.146.48|-|7
167.94.146.51|-|7
167.94.146.53|-|7
167.94.146.54|-|7
167.94.146.55|-|7
167.94.146.57|-|7
167.94.146.60|-|7
168.167.228.74|-|7
176.235.182.73|-|7
180.76.202.69|-|7
181.49.50.6|-|7
182.76.204.237|nsg-static-237.204.76.182-airtel.com|7
182.93.50.90|n18293z50l90.static.ctmip.net|7
183.82.126.193|183.82.126.193.actcorp.in|7
186.118.142.216|-|7
187.16.96.250|mvx-187-16-96-250.mundivox.com|7
189.112.0.11|189-112-000-011.static.ctbctelecom.com.br|7
190.202.31.74|190-202-31-74.chc-00.rai.cantv.net|7
192.210.160.141|192-210-160-141-host.colocrossing.com|7
193.32.162.145|-|7
193.46.255.99|hostingmailto251.statics.servermail.org|7
193.46.255.159|hostingmailto066.statics.servermail.org|7
195.24.215.70|-|7
197.5.145.73|-|7
198.23.174.113|198-23-174-113-host.colocrossing.com|7
198.98.53.110|-|7
199.45.154.135|scanner-203.hk2.censys-scanner.com|7
199.45.155.95|scanner-204.hk2.censys-scanner.com|7
199.45.155.101|scanner-206.hk2.censys-scanner.com|7
199.45.155.109|scanner-206.hk2.censys-scanner.com|7
202.64.45.197|197.45.64.202.static.pacific.net.hk|7
202.157.177.161|-|7
203.113.174.95|-|7
203.190.53.154|-|7
204.76.203.28|204.76.203.28.ptr.pfcloud.network|7
206.168.34.33|unused-space.coop.net|7
206.168.34.38|unused-space.coop.net|7
206.168.34.61|unused-space.coop.net|7
206.168.34.114|unused-space.coop.net|7
210.114.22.126|-|7
210.177.143.61|-|7
211.20.14.156|211-20-14-156.hinet-ip.hinet.net|7
216.10.250.218|server.digitalspoint.com|7
220.247.224.226|-|7
221.229.218.50|-|7
223.197.186.7|223-197-186-7.static.imsbiz.com|7
