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

Wall of Shame (2025-06-21)
----

|IP|DNS lookup|Number of (black)lists|
|---|---|--:|
80.82.77.139|dojo.census.shodan.io|10
92.118.39.92|-|9
92.118.39.95|-|9
103.237.144.204|-|9
118.194.253.212|-|9
176.65.148.55|hosted-by.pfcloud.io|9
193.32.162.157|-|9
202.99.253.98|-|9
223.130.11.165|-|9
14.29.198.130|-|8
14.63.160.31|-|8
20.108.12.1|-|8
27.254.118.114|-|8
36.67.70.198|sehati.tanjabtimkab.go.id|8
36.158.177.51|-|8
46.105.70.190|b5.scanner.modat.io|8
64.227.174.243|-|8
71.6.158.166|ninja.census.shodan.io|8
71.6.199.23|einstein.census.shodan.io|8
79.3.96.178|host-79-3-96-178.business.telecomitalia.it|8
80.82.77.33|sky.census.shodan.io|8
80.82.77.202|rnd.group-ib.com|8
93.123.109.191|-|8
93.174.95.106|battery.census.shodan.io|8
94.102.49.193|cloud.census.shodan.io|8
95.58.255.251|95.58.255.251.static.telecom.kz|8
103.191.92.173|ip103-191-92-173.cloudhost.web.id|8
104.244.77.50|-|8
115.91.91.182|-|8
129.148.21.13|-|8
136.232.203.134|-|8
140.246.92.156|-|8
144.217.13.134|vps-2cf81da8.vps.ovh.ca|8
152.67.167.117|-|8
158.51.126.147|-|8
162.142.125.209|scanner-05.ch1.censys-scanner.com|8
181.116.220.12|-|8
185.93.89.118|-|8
185.165.191.27|red.census.shodan.io|8
186.117.149.128|-|8
189.7.17.61|bd07113d.virtua.com.br|8
190.85.15.251|-|8
192.42.116.212|15.tor-exit.nothingtohide.nl|8
193.32.162.141|-|8
193.32.162.145|-|8
193.32.162.146|-|8
193.32.162.151|-|8
195.165.181.16|mobile-user-c3a5b5-16.dhcp.inet.fi|8
195.178.110.160|-|8
196.189.87.177|aii.et|8
204.44.127.231|-|8
220.80.223.144|-|8
2.229.29.110|2-229-29-110.ip194.fastwebnet.it|7
3.130.96.91|scan.cypex.ai|7
14.63.196.175|-|7
14.63.217.28|-|7
27.254.137.144|-|7
27.254.149.199|-|7
27.254.235.1|-|7
27.254.235.2|-|7
27.254.235.3|-|7
27.254.235.4|-|7
31.15.169.22|31-15-169-22.static.telemach.net|7
34.128.88.167|167.88.128.34.bc.googleusercontent.com|7
36.64.68.99|-|7
36.66.16.233|-|7
36.91.166.34|-|7
38.72.89.25|-|7
45.119.212.99|-|7
45.120.216.232|-|7
45.121.147.47|-|7
46.101.23.51|-|7
47.234.143.55|syn-047-234-143-055.res.spectrum.com|7
49.64.169.153|-|7
51.68.226.87|vps-fc0b2823.vps.ovh.net|7
51.75.64.35|vps-3d54f2a3.vps.ovh.net|7
51.75.124.228|vps-edcbbc9b.vps.ovh.net|7
51.75.194.10|vps-f8f463b5.vps.ovh.net|7
51.89.166.236|vps-5f0ef624.vps.ovh.net|7
51.158.120.121|121-120-158-51.instances.scw.cloud|7
51.178.43.161|prod1.masterit.fr|7
51.210.243.91|vps-204029ff.vps.ovh.net|7
51.222.30.51|vps-efc42bd4.vps.ovh.ca|7
54.37.233.240|vps-ac1bf43a.vps.ovh.net|7
59.12.160.91|-|7
59.34.57.200|-|7
62.210.97.97|62-210-97-97.rev.poneytelecom.eu|7
69.49.247.178|69-49-247-178.webhostbox.net|7
71.6.135.131|soda.census.shodan.io|7
77.82.90.210|-|7
81.133.106.57|host81-133-106-57.in-addr.btopenworld.com|7
81.192.46.45|adsl-45-46-192-81.adsl.iam.net.ma|7
82.207.8.154|154-8-207-82.pool.ukrtel.net|7
84.51.43.58|host-84-51-43-58.teletektelekom.com|7
86.1.122.70|cpc94368-ward12-2-0-cust69.10-2.cable.virginm.net|7
89.39.246.58|-|7
89.97.218.142|89-97-218-142.ip19.fastwebnet.it|7
89.248.172.16|house.census.shodan.io|7
89.252.140.204|-|7
91.205.219.185|-|7
92.55.190.215|-|7
92.118.39.62|-|7
95.167.225.76|-|7
101.36.119.218|-|7
101.47.72.10|-|7
102.210.80.6|-|7
103.2.225.33|-|7
103.61.44.100|-|7
103.63.25.13|ip103-63-25-13.cloudhost.web.id|7
103.148.100.146|-|7
103.149.27.228|-|7
103.149.86.208|-|7
103.183.74.130|ip103-183-74-130.cloudhost.web.id|7
103.246.42.72|rw-0072-42.246.103.rcil.gov.in|7
104.223.120.159|104-223-120-159-host.colocrossing.com|7
104.236.248.24|webneers.beta|7
105.72.172.250|-|7
107.0.200.227|smtp.nationaltubesupply.com|7
107.170.228.16|wfinancial20230805-s-1vcpu-2gb-sfo1-01-ubuntu-16.04|7
109.167.197.20|109-167-197-20.westcall.net|7
111.238.174.6|KD111238174006.ppp-bb.dion.ne.jp|7
112.120.228.189|n112120228189.netvigator.com|7
113.193.234.210|-|7
116.172.130.191|-|7
117.50.119.25|-|7
118.122.147.195|-|7
119.60.2.236|-|7
119.96.173.169|-|7
122.155.0.205|www.thalaychupsorn.go.th|7
123.30.249.49|static.vnpt.vn|7
123.58.213.127|-|7
125.72.54.155|-|7
125.228.185.131|125-228-185-131.hinet-ip.hinet.net|7
128.199.148.185|-|7
139.59.3.26|-|7
139.59.21.124|-|7
139.59.173.98|-|7
139.59.188.13|-|7
142.44.247.114|vps-0557d265.vps.ovh.ca|7
142.93.116.14|-|7
143.110.150.27|-|7
143.110.237.160|-|7
144.48.8.100|-|7
147.185.132.132|-|7
147.185.132.140|-|7
151.252.84.225|151.252.84.225.ip.tele-plus.ru|7
152.42.225.137|-|7
161.49.89.39|161.49.89.39.convergeict.com|7
162.142.125.46|-|7
162.142.125.112|scanner-19.ch1.censys-scanner.com|7
162.142.125.114|scanner-19.ch1.censys-scanner.com|7
162.142.125.123|scanner-20.ch1.censys-scanner.com|7
162.142.125.204|-|7
162.142.125.210|scanner-05.ch1.censys-scanner.com|7
162.142.125.217|scanner-05.ch1.censys-scanner.com|7
162.142.125.223|scanner-25.ch1.censys-scanner.com|7
162.157.117.92|d162-157-117-92.abhsia.telus.net|7
164.177.31.66|static-csq-cds-031066.business.bouyguestelecom.com|7
165.154.244.165|-|7
167.94.145.99|-|7
167.94.146.59|-|7
167.172.153.88|-|7
176.94.185.62|-|7
178.251.140.3|b32-mgmt-gw.dssv.ru|7
179.43.176.236|-|7
182.93.50.90|n18293z50l90.static.ctmip.net|7
183.224.219.194|-|7
186.96.151.198|fixed-186-96-151-198.totalplay.net|7
186.118.142.216|-|7
186.124.22.55|host55.186-124-22.telecom.net.ar|7
188.166.106.38|-|7
192.42.116.179|27.tor-exit.nothingtohide.nl|7
192.42.116.214|17.tor-exit.nothingtohide.nl|7
193.32.162.143|-|7
193.70.87.152|152.ip-193-70-87.eu|7
194.113.236.217|-|7
195.239.97.254|-|7
196.251.80.92|undefined.hostname.localhost|7
196.251.88.103|-|7
196.251.92.207|-|7
197.5.145.73|-|7
197.5.145.102|-|7
197.227.8.186|-|7
198.23.143.193|host.sindad.cloud|7
198.24.79.245|syn-198-024-079-245.biz.spectrum.com|7
199.45.155.105|scanner-206.hk2.censys-scanner.com|7
200.73.135.75|75.135.73.200.cab.prima.net.ar|7
200.118.99.170|dynamic-ip-cr20011899170.cable.net.co|7
200.196.50.91|mvx-200-196-50-91.mundivox.com|7
201.131.212.19|-|7
201.149.49.162|cuallix.com|7
202.157.177.33|mail.simaster-brebeskab.id|7
203.125.118.248|mailbox1.solutiondetails.com.sg|7
205.185.113.189|localhost|7
206.172.46.162|-|7
209.38.80.46|-|7
209.38.91.150|-|7
209.38.228.147|core1.bbe.masterit-dev.cloud|7
210.114.22.126|-|7
211.253.9.49|-|7
211.253.10.96|-|7
216.10.250.218|server.digitalspoint.com|7
217.182.230.0|ip0.ip-217-182-230.eu|7
220.95.14.102|-|7
221.159.150.85|-|7
221.161.235.168|-|7
221.229.218.50|-|7
222.172.32.246|-|7
223.197.186.7|223-197-186-7.static.imsbiz.com|7
