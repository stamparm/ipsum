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

Wall of Shame (2025-07-06)
----

|IP|DNS lookup|Number of (black)lists|
|---|---|--:|
193.32.162.157|-|10
3.130.96.91|scan.cypex.ai|9
93.123.109.191|-|9
176.65.148.12|hosted-by.pfcloud.io|9
193.32.162.151|-|9
196.251.88.103|-|9
218.102.217.85|pcd685085.netvigator.com|9
45.148.10.240|-|8
80.82.77.33|sky.census.shodan.io|8
89.97.218.142|89-97-218-142.ip19.fastwebnet.it|8
102.223.208.49|-|8
118.70.178.158|-|8
118.194.253.212|-|8
125.17.108.32|server.serverinfo.in.net|8
156.241.0.211|-|8
167.94.145.97|-|8
167.94.146.57|-|8
176.65.148.55|hosted-by.pfcloud.io|8
185.93.89.118|-|8
185.156.73.234|-|8
185.165.191.26|purple.census.shodan.io|8
193.32.162.141|-|8
194.0.234.93|-|8
195.178.110.160|-|8
196.251.81.116|undefined.hostname.localhost|8
3.131.215.38|ec2-3-131-215-38.us-east-2.compute.amazonaws.com|7
3.138.185.30|scan.cypex.ai|7
14.29.198.130|-|7
18.220.154.78|ec2-18-220-154-78.us-east-2.compute.amazonaws.com|7
27.254.235.3|-|7
27.254.235.13|-|7
31.15.169.22|31-15-169-22.static.telemach.net|7
31.129.22.162|48481.ip-ptr.tech|7
31.220.102.39|vmi2049644.contaboserver.net|7
34.64.41.134|134.41.64.34.bc.googleusercontent.com|7
34.171.244.191|191.244.171.34.bc.googleusercontent.com|7
36.67.70.198|sehati.tanjabtimkab.go.id|7
36.139.226.237|-|7
41.59.86.232|232.86-59-41.static-zone.ttcldata.net|7
45.120.216.232|-|7
45.121.147.47|-|7
45.131.155.253|-|7
51.158.120.121|121-120-158-51.instances.scw.cloud|7
51.159.54.22|51-159-54-22.rev.poneytelecom.eu|7
60.251.120.199|60-251-120-199.hinet-ip.hinet.net|7
65.49.1.10|-|7
65.49.1.66|-|7
65.49.1.192|-|7
71.6.146.186|inspire.census.shodan.io|7
71.6.199.23|einstein.census.shodan.io|7
77.90.185.6|-|7
80.82.77.139|dojo.census.shodan.io|7
80.82.77.202|rnd.group-ib.com|7
91.205.219.185|-|7
92.27.101.99|host-92-27-101-99.static.as13285.net|7
92.118.39.62|-|7
92.118.39.95|-|7
93.19.172.217|217.172.19.93.rev.sfr.net|7
93.174.95.106|battery.census.shodan.io|7
94.159.98.241|138696.h2.nexus|7
95.167.225.76|-|7
95.188.91.101|-|7
102.140.97.134|-|7
103.113.105.228|103.113.105.228.dynamic-ekowebtech.net|7
104.234.115.67|crawler067.deepfield.net|7
104.244.77.50|-|7
106.13.78.99|-|7
107.170.228.16|wfinancial20230805-s-1vcpu-2gb-sfo1-01-ubuntu-16.04|7
113.57.108.167|-|7
117.50.51.198|-|7
120.48.32.185|-|7
136.232.98.230|-|7
139.59.188.13|-|7
139.150.69.56|-|7
159.89.16.251|-|7
162.142.125.41|-|7
162.142.125.112|scanner-19.ch1.censys-scanner.com|7
162.142.125.118|scanner-19.ch1.censys-scanner.com|7
162.142.125.121|scanner-20.ch1.censys-scanner.com|7
162.142.125.127|scanner-20.ch1.censys-scanner.com|7
162.142.125.205|-|7
162.142.125.213|scanner-05.ch1.censys-scanner.com|7
162.142.125.217|scanner-05.ch1.censys-scanner.com|7
162.142.125.222|scanner-25.ch1.censys-scanner.com|7
164.90.229.159|-|7
167.94.138.169|-|7
167.94.146.51|-|7
167.94.146.59|-|7
167.94.146.63|-|7
176.65.148.10|hosted-by.pfcloud.io|7
177.229.197.38|customer-MCA-TGZ-197-38.megared.net.mx|7
181.49.50.6|-|7
181.116.220.12|-|7
185.156.73.233|-|7
185.242.226.22|security.criminalip.com|7
187.16.96.250|mvx-187-16-96-250.mundivox.com|7
189.7.17.61|bd07113d.virtua.com.br|7
190.129.122.185|-|7
193.32.162.145|-|7
193.32.162.146|-|7
194.113.236.217|-|7
195.178.110.108|-|7
195.178.110.125|-|7
196.189.87.177|aii.et|7
196.251.69.18|-|7
196.251.86.239|-|7
196.251.92.75|-|7
198.23.174.113|198-23-174-113-host.colocrossing.com|7
198.24.79.245|syn-198-024-079-245.biz.spectrum.com|7
199.45.155.81|scanner-204.hk2.censys-scanner.com|7
200.189.192.3|spo.dts.gemalto.com.br|7
201.76.120.30|30.120.76.201.in-addr.arpa.verointernet.com.br|7
202.51.214.99|-|7
204.44.127.231|-|7
211.253.10.96|-|7
216.10.250.218|server.digitalspoint.com|7
223.99.200.254|-|7
