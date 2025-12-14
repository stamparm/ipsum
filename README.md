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

Wall of Shame (2025-12-14)
----

|IP|DNS lookup|Number of (black)lists|
|---|---|--:|
2.57.121.112|dns112.personaliseplus.com|9
45.148.10.121|-|9
71.6.158.166|ninja.census.shodan.io|9
80.94.92.177|-|9
101.36.104.242|-|9
128.14.227.179|-|9
143.20.185.79|-|9
163.5.148.15|-|9
179.43.184.242|hostedby.privatelayer.com|9
64.227.97.118|-|8
80.82.77.33|sky.census.shodan.io|8
80.94.92.166|-|8
80.94.92.182|-|8
80.94.92.184|-|8
80.94.92.186|-|8
86.54.31.40|blue.census.shodan.io|8
89.185.84.23|57899.ip-ptr.tech|8
93.174.95.106|battery.census.shodan.io|8
114.111.54.188|-|8
128.14.167.115|-|8
128.14.167.117|-|8
147.182.194.60|-|8
162.142.125.46|scanner-201.ch1.censys-scanner.com|8
162.142.125.118|-|8
162.142.125.214|scanner-207.ch1.censys-scanner.com|8
167.94.146.52|-|8
185.138.88.86|-|8
193.46.255.99|hostingmailto251.statics.servermail.org|8
206.168.34.39|unused-space.coop.net|8
213.55.85.202|-|8
220.80.223.144|-|8
2.57.121.25|hosting25.tronicsat.com|7
3.130.96.91|scan.cypex.ai|7
3.131.215.38|ec2-3-131-215-38.us-east-2.compute.amazonaws.com|7
3.134.148.59|scan.cypex.ai|7
3.137.73.221|scan.cypex.ai|7
5.101.64.6|scan.f6.security|7
5.187.97.40|-|7
12.156.67.18|-|7
13.93.203.231|-|7
14.63.217.28|-|7
27.111.32.174|-|7
35.240.174.82|82.174.240.35.bc.googleusercontent.com|7
36.255.3.203|-|7
43.252.231.122|-|7
45.79.181.94|luxembourg.scan.bufferover.run|7
45.79.181.179|andorra.scan.bufferover.run|7
45.81.23.49|-|7
45.121.147.47|-|7
45.172.152.74|-|7
46.19.100.88|-|7
46.161.50.108|scan.f6.security|7
50.84.211.204|syn-050-084-211-204.biz.spectrum.com|7
51.75.253.68|vps-94085b09.vps.ovh.net|7
51.158.120.121|121-120-158-51.instances.scw.cloud|7
60.199.224.2|60-199-224-2.static.tfn.net.tw|7
61.245.11.87|-|7
64.227.174.243|-|7
66.132.153.128|scanner-001.ch1.censys-scanner.com|7
66.240.192.138|census8.shodan.io|7
71.6.135.131|soda.census.shodan.io|7
71.6.165.200|census12.shodan.io|7
71.6.199.23|einstein.census.shodan.io|7
78.109.200.147|-|7
80.94.92.165|-|7
80.94.93.233|-|7
81.211.72.167|-|7
83.168.107.220|hosted-by.SkillHost.PL|7
85.18.236.229|85-18-236-229.ip.fastwebnet.it|7
91.199.82.162|-|7
94.102.49.193|cloud.census.shodan.io|7
94.141.161.6|-|7
95.167.225.76|-|7
95.188.91.101|-|7
101.126.55.179|-|7
103.49.238.104|ip103-49-238-104.cloudhost.web.id|7
103.163.119.125|-|7
103.181.143.73|-|7
103.237.144.204|-|7
103.252.73.37|-|7
122.155.0.205|host1.bgs.co.th|7
125.21.59.218|-|7
128.199.103.139|-|7
128.199.157.145|-|7
129.45.84.93|host-93.84.45.129.djezzycloud.dz|7
144.217.13.134|vps-2cf81da8.vps.ovh.ca|7
145.239.85.111|vps-87a498e8.vps.ovh.net|7
150.241.115.127|-|7
156.239.254.141|-|7
159.146.11.164|-|7
160.174.129.232|-|7
161.18.228.75|-|7
162.142.125.33|scanner-201.ch1.censys-scanner.com|7
162.142.125.113|-|7
162.142.125.115|-|7
162.142.125.117|-|7
162.142.125.122|-|7
162.142.125.124|-|7
162.142.125.201|scanner-202.ch1.censys-scanner.com|7
162.142.125.207|scanner-202.ch1.censys-scanner.com|7
162.142.125.210|scanner-207.ch1.censys-scanner.com|7
162.142.125.217|scanner-207.ch1.censys-scanner.com|7
167.94.138.60|scanner-07.ch1.censys-scanner.com|7
167.94.146.48|-|7
167.94.146.51|-|7
167.94.146.53|-|7
167.94.146.58|-|7
167.94.146.61|-|7
167.94.146.62|-|7
167.94.146.63|-|7
171.244.37.96|-|7
176.32.195.85|scan.f6.security|7
176.213.141.182|176x213x141x182.dynamic.rostov.ertelecom.ru|7
178.176.250.39|-|7
185.242.247.154|-|7
186.96.145.241|fixed-186-96-145-241.totalplay.net|7
186.96.151.198|fixed-186-96-151-198.totalplay.net|7
187.16.96.250|mvx-187-16-96-250.mundivox.com|7
187.210.77.100|customer-187-210-77-100.uninet-ide.com.mx|7
189.217.130.86|customer-189-217-130-86.cablevision.net.mx|7
190.124.153.17|customer-ftth-sl-190-124-153-17.megacable.com.ar|7
193.32.162.146|-|7
193.32.162.157|-|7
193.46.255.20|hostingmailto112.statics.servermail.org|7
193.46.255.103|hostingmailto005.statics.servermail.org|7
193.46.255.159|hostingmailto066.statics.servermail.org|7
197.5.145.73|-|7
197.227.8.186|-|7
198.98.53.110|-|7
200.32.52.150|-|7
201.76.120.30|30.120.76.201.in-addr.arpa.verointernet.com.br|7
203.19.35.147|-|7
203.145.34.222|ip203-145-34-222.cloudhost.web.id|7
206.168.34.36|unused-space.coop.net|7
206.168.34.45|unused-space.coop.net|7
206.168.34.200|unused-space.coop.net|7
209.141.34.213|-|7
211.20.14.156|211-20-14-156.hinet-ip.hinet.net|7
218.157.163.203|-|7
221.159.150.85|-|7
221.161.235.168|-|7
