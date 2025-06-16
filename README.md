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

Wall of Shame (2025-06-16)
----

|IP|DNS lookup|Number of (black)lists|
|---|---|--:|
193.32.162.157|-|10
223.130.11.165|-|10
27.254.118.114|-|8
45.82.78.254|-|8
59.34.57.200|-|8
80.82.77.33|sky.census.shodan.io|8
80.82.77.202|rnd.group-ib.com|8
89.97.218.142|89-97-218-142.ip19.fastwebnet.it|8
92.118.39.95|-|8
93.123.109.191|-|8
93.174.95.106|battery.census.shodan.io|8
103.237.144.204|-|8
113.56.161.14|-|8
156.241.0.211|-|8
158.51.126.147|-|8
167.94.145.97|-|8
167.94.146.48|-|8
185.93.89.118|-|8
193.32.162.141|-|8
193.32.162.143|-|8
195.178.110.160|-|8
196.203.106.97|-|8
196.251.88.103|-|8
211.253.10.96|-|8
219.77.222.7|n219077222007.netvigator.com|8
3.132.23.201|scan.cypex.ai|7
3.134.148.59|scan.cypex.ai|7
3.137.73.221|scan.cypex.ai|7
12.156.67.18|-|7
14.29.198.130|-|7
14.29.223.128|-|7
14.63.196.175|-|7
14.161.29.253|-|7
20.55.88.105|azpdesdy7067.stretchoid.com|7
24.199.110.55|-|7
27.112.79.10|ip27-112-79-10.cloudhost.web.id|7
27.254.137.144|-|7
27.254.149.199|-|7
27.254.235.4|-|7
34.64.41.134|134.41.64.34.bc.googleusercontent.com|7
34.75.26.147|147.26.75.34.bc.googleusercontent.com|7
34.128.88.167|167.88.128.34.bc.googleusercontent.com|7
34.142.110.144|144.110.142.34.bc.googleusercontent.com|7
34.175.118.185|185.118.175.34.bc.googleusercontent.com|7
35.237.94.18|18.94.237.35.bc.googleusercontent.com|7
36.64.68.99|-|7
36.66.16.233|-|7
36.67.70.198|sehati.tanjabtimkab.go.id|7
36.91.166.34|-|7
36.139.226.237|-|7
39.109.126.152|-|7
42.51.13.138|-|7
43.224.48.86|-|7
45.84.107.17|exit-12.tor.r0cket.net|7
45.118.146.109|-|7
46.62.131.224|static.224.131.62.46.clients.your-server.de|7
46.101.23.51|-|7
46.101.38.102|-|7
47.180.114.229|47-180-114-229.944e76fe48b133ae6f88b784db937d44.ip.frontiernet.net|7
50.192.223.205|-|7
51.68.226.87|vps-fc0b2823.vps.ovh.net|7
51.89.166.236|vps-5f0ef624.vps.ovh.net|7
51.158.120.121|121-120-158-51.instances.scw.cloud|7
58.18.213.99|-|7
59.12.160.91|-|7
62.36.40.104|mail1.prevecam.es|7
62.210.131.177|62-210-131-177.rev.poneytelecom.eu|7
66.240.219.146|burger.census.shodan.io|7
66.240.236.119|census6.shodan.io|7
68.183.199.113|-|7
71.6.135.131|soda.census.shodan.io|7
71.6.146.130|refrigerator.census.shodan.io|7
71.6.199.23|einstein.census.shodan.io|7
77.82.90.210|-|7
79.3.96.178|host-79-3-96-178.business.telecomitalia.it|7
80.82.70.133|rnd.group-ib.com|7
80.82.77.139|dojo.census.shodan.io|7
80.191.247.45|-|7
81.133.106.57|host81-133-106-57.in-addr.btopenworld.com|7
81.192.46.45|adsl-45-46-192-81.adsl.iam.net.ma|7
81.192.87.130|adsl-130-87-192-81.adsl2.iam.net.ma|7
81.211.72.167|-|7
85.18.236.229|85-18-236-229.ip.fastwebnet.it|7
86.54.31.38|blue2.census.shodan.io|7
87.248.226.146|87.248.226.146.pool.sknt.ru|7
91.77.163.86|-|7
92.118.39.62|-|7
94.102.49.193|cloud.census.shodan.io|7
94.254.0.234|h-94-254-0-234.na.cust.bahnhof.se|7
95.85.47.10|sexolondon.com-1705306061476-s-1vcpu-2gb-ams2-01|7
95.167.225.76|-|7
102.140.97.134|-|7
103.10.44.105|-|7
103.39.93.93|-|7
103.48.192.48|-|7
103.63.25.13|ip103-63-25-13.cloudhost.web.id|7
103.91.136.18|-|7
103.144.87.192|-|7
103.149.27.228|-|7
103.233.206.154|-|7
109.167.197.20|109-167-197-20.westcall.net|7
111.67.199.209|-|7
114.130.56.191|-|7
116.172.130.191|-|7
118.122.147.195|-|7
118.179.219.137|-|7
119.202.128.28|-|7
121.52.147.5|upesh.edu.pk|7
122.114.69.235|-|7
123.253.162.254|undefined.hostname.localhost|7
125.21.59.218|-|7
128.199.148.185|-|7
132.148.164.7|7.164.148.132.host.secureserver.net|7
136.232.203.134|-|7
139.59.64.179|-|7
139.59.173.98|-|7
142.44.247.114|vps-0557d265.vps.ovh.ca|7
143.110.150.27|-|7
143.110.237.160|-|7
144.217.13.134|vps-2cf81da8.vps.ovh.ca|7
147.185.132.102|-|7
150.136.129.10|-|7
150.223.20.12|-|7
151.80.61.151|vps-5d95afd4.vps.ovh.net|7
151.95.9.145|-|7
152.67.167.117|-|7
152.228.131.33|vps-a34f1667.vps.ovh.net|7
154.221.27.234|-|7
161.49.89.39|161.49.89.39.convergeict.com|7
162.142.125.39|-|7
162.142.125.43|-|7
162.142.125.47|-|7
164.177.31.66|static-csq-cds-031066.business.bouyguestelecom.com|7
167.94.146.49|-|7
167.94.146.53|-|7
167.94.146.55|-|7
167.94.146.60|-|7
167.172.153.88|-|7
171.244.37.96|-|7
176.65.148.10|hosted-by.pfcloud.io|7
176.65.148.55|hosted-by.pfcloud.io|7
177.12.2.75|fttx.cable-17712275.predialnet.com.br|7
177.229.197.38|customer-MCA-TGZ-197-38.megared.net.mx|7
180.100.217.164|-|7
181.176.156.130|-|7
181.209.63.113|-|7
182.44.72.96|-|7
182.71.75.106|nsg-static-106.75.71.182.airtel.in|7
182.93.50.90|n18293z50l90.static.ctmip.net|7
182.229.10.141|-|7
185.156.73.233|-|7
185.156.73.234|-|7
185.157.223.126|185-157-223-126-static.glesys.net|7
185.213.165.72|static.72.165.213.185.clients.irandns.com|7
185.235.16.48|-|7
185.242.226.22|security.criminalip.com|7
186.117.149.128|-|7
189.7.17.61|bd07113d.virtua.com.br|7
190.12.102.58|static.58.102.12.190.cps.com.ar|7
190.85.15.251|-|7
190.129.122.86|-|7
192.42.116.179|27.tor-exit.nothingtohide.nl|7
193.32.162.146|-|7
193.32.162.151|-|7
194.9.56.139|-|7
195.165.181.16|mobile-user-c3a5b5-16.dhcp.inet.fi|7
196.189.87.177|aii.et|7
196.251.80.92|undefined.hostname.localhost|7
197.5.145.8|-|7
197.5.145.102|-|7
197.227.8.186|-|7
197.253.54.22|-|7
200.69.236.207|seldon.tecnologica.com.ar|7
200.118.99.170|dynamic-ip-cr20011899170.cable.net.co|7
200.189.192.3|spo.dts.gemalto.com.br|7
201.131.212.19|-|7
202.157.177.33|mail.simaster-brebeskab.id|7
205.185.113.189|localhost|7
206.172.46.162|-|7
210.91.73.167|-|7
211.20.14.156|211-20-14-156.hinet-ip.hinet.net|7
211.105.223.49|-|7
211.253.9.49|-|7
212.33.198.185|-|7
216.172.190.206|col.colettelounge.com|7
216.194.174.27|-|7
217.182.230.0|ip0.ip-217-182-230.eu|7
218.56.160.82|-|7
218.145.181.48|-|7
221.156.126.1|-|7
221.159.150.85|-|7
221.161.235.168|-|7
222.107.156.227|-|7
223.197.186.7|223-197-186-7.static.imsbiz.com|7
