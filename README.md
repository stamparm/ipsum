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

Wall of Shame (2025-08-09)
----

|IP|DNS lookup|Number of (black)lists|
|---|---|--:|
68.69.186.182|-|11
80.94.93.119|-|10
176.65.149.231|hosted-by.pfcloud.io|10
179.43.189.98|hostedby.privatelayer.com|10
80.94.93.233|-|9
93.174.95.106|battery.census.shodan.io|9
176.65.148.235|hosted-by.pfcloud.io|9
176.65.148.240|hosted-by.pfcloud.io|9
185.93.89.4|-|9
193.46.255.217|hostingmailto131.statics.servermail.org|9
66.240.192.138|census8.shodan.io|8
71.6.165.200|census12.shodan.io|8
71.6.199.23|einstein.census.shodan.io|8
80.82.77.33|sky.census.shodan.io|8
80.82.77.139|dojo.census.shodan.io|8
80.82.77.202|rnd.group-ib.com|8
81.181.129.172|-|8
93.123.109.189|-|8
121.186.31.54|-|8
148.178.22.65|-|8
148.178.22.86|-|8
148.178.22.247|-|8
161.132.54.101|-|8
162.142.125.34|scanner-201.ch1.censys-scanner.com|8
162.142.125.118|-|8
162.142.125.125|-|8
162.142.125.214|scanner-207.ch1.censys-scanner.com|8
167.94.145.103|-|8
167.94.145.110|-|8
185.165.191.27|red.census.shodan.io|8
193.32.162.157|-|8
195.178.110.160|-|8
195.178.110.224|-|8
196.251.69.107|-|8
211.253.10.96|-|8
217.113.49.161|161.49.113.217.static.v4yip.hu|8
3.131.215.38|ec2-3-131-215-38.us-east-2.compute.amazonaws.com|7
3.132.23.201|scan.cypex.ai|7
3.137.73.221|scan.cypex.ai|7
3.143.33.63|scan.cypex.ai|7
8.222.233.19|-|7
12.156.67.18|-|7
14.63.196.175|-|7
20.80.88.209|azpdcslw5dff.stretchoid.com|7
23.147.8.240|-|7
27.112.79.10|ip27-112-79-10.cloudhost.web.id|7
27.254.192.185|-|7
36.91.166.34|-|7
43.166.136.113|-|7
45.78.192.123|-|7
45.78.196.179|-|7
45.78.196.241|-|7
45.84.107.97|exit-13.tor.r0cket.net|7
45.148.10.240|-|7
45.175.157.53|-|7
45.232.73.84|-|7
51.178.43.161|prod1.masterit.fr|7
60.199.224.2|60-199-224-2.static.tfn.net.tw|7
62.193.106.227|-|7
65.181.112.148|markledo.com|7
71.6.135.131|soda.census.shodan.io|7
71.6.146.185|pirate.census.shodan.io|7
71.6.158.166|ninja.census.shodan.io|7
71.6.167.142|census9.shodan.io|7
77.82.90.210|-|7
80.82.70.118|rnd.group-ib.com|7
80.94.95.112|-|7
86.54.31.32|hat.census.shodan.io|7
86.54.31.42|green.census.shodan.io|7
89.97.218.142|89-97-218-142.ip19.fastwebnet.it|7
89.248.167.131|mason.census.shodan.io|7
91.77.163.86|-|7
91.205.219.185|-|7
93.123.109.181|-|7
93.123.109.185|-|7
94.102.49.193|cloud.census.shodan.io|7
94.254.0.234|h-94-254-0-234.na.cust.bahnhof.se|7
95.58.255.251|95.58.255.251.static.telecom.kz|7
95.85.114.218|-|7
95.167.225.76|-|7
103.49.238.104|ip103-49-238-104.cloudhost.web.id|7
103.153.190.121|-|7
103.209.43.169|-|7
104.234.115.42|crawler042.deepfield.net|7
109.167.197.20|109-167-197-20.westcall.net|7
112.196.70.142|-|7
119.18.55.217|119-18-55-217.webhostbox.net|7
121.52.147.5|upesh.edu.pk|7
121.142.146.167|-|7
123.253.162.254|undefined.hostname.localhost|7
128.199.148.185|-|7
136.228.161.66|-|7
139.59.188.13|-|7
139.59.226.77|-|7
147.182.194.60|-|7
148.178.22.9|-|7
148.178.22.13|-|7
148.178.22.14|-|7
148.178.22.17|-|7
148.178.22.20|-|7
148.178.22.25|-|7
148.178.22.26|-|7
148.178.22.28|-|7
148.178.22.30|-|7
148.178.22.32|-|7
148.178.22.40|-|7
148.178.22.50|-|7
148.178.22.56|-|7
148.178.22.67|-|7
148.178.22.69|-|7
148.178.22.70|-|7
148.178.22.92|-|7
155.94.155.19|-|7
159.65.146.196|-|7
162.142.125.33|scanner-201.ch1.censys-scanner.com|7
162.142.125.44|scanner-201.ch1.censys-scanner.com|7
162.142.125.116|-|7
162.142.125.117|-|7
162.142.125.121|-|7
162.142.125.124|-|7
162.142.125.127|-|7
162.142.125.193|scanner-202.ch1.censys-scanner.com|7
162.142.125.196|scanner-202.ch1.censys-scanner.com|7
162.142.125.201|scanner-202.ch1.censys-scanner.com|7
162.142.125.208|scanner-207.ch1.censys-scanner.com|7
162.142.125.212|scanner-207.ch1.censys-scanner.com|7
162.142.125.215|scanner-207.ch1.censys-scanner.com|7
162.142.125.217|scanner-207.ch1.censys-scanner.com|7
162.142.125.223|scanner-207.ch1.censys-scanner.com|7
167.94.138.117|scanner-27.ch1.censys-scanner.com|7
167.94.138.177|-|7
167.94.145.96|-|7
167.94.145.101|-|7
167.94.145.107|-|7
167.94.145.108|-|7
167.94.145.111|-|7
167.94.146.50|-|7
167.94.146.51|-|7
167.94.146.53|-|7
167.94.146.55|-|7
167.94.146.56|-|7
167.94.146.57|-|7
167.94.146.58|-|7
167.94.146.60|-|7
167.94.146.61|-|7
167.94.146.63|-|7
171.214.1.218|-|7
175.107.32.186|-|7
176.32.195.85|-|7
176.65.148.12|hosted-by.pfcloud.io|7
176.109.80.72|-|7
178.176.250.39|-|7
183.82.126.193|183.82.126.193.actcorp.in|7
185.156.73.233|-|7
186.96.145.241|fixed-186-96-145-241.totalplay.net|7
187.16.96.250|mvx-187-16-96-250.mundivox.com|7
187.49.152.10|ns1.entertelecom.com.br|7
193.32.162.146|-|7
194.0.234.93|-|7
195.178.110.133|-|7
195.178.110.211|-|7
196.251.69.18|-|7
196.251.69.116|-|7
196.251.69.205|-|7
196.251.81.116|undefined.hostname.localhost|7
196.251.81.204|undefined.hostname.localhost|7
196.251.83.215|undefined.hostname.localhost|7
196.251.84.34|undefined.hostname.localhost|7
196.251.116.162|-|7
196.251.116.191|-|7
196.251.117.208|-|7
197.5.145.121|-|7
199.45.155.64|scanner-202.hk2.censys-scanner.com|7
199.204.96.26|-|7
200.118.99.170|dynamic-ip-cr20011899170.cable.net.co|7
201.17.133.138|c911858a.virtua.com.br|7
201.76.120.30|30.120.76.201.in-addr.arpa.verointernet.com.br|7
203.145.34.222|ip203-145-34-222.cloudhost.web.id|7
206.168.34.76|unused-space.coop.net|7
206.168.34.82|unused-space.coop.net|7
206.168.34.85|unused-space.coop.net|7
206.168.34.202|unused-space.coop.net|7
210.91.73.167|-|7
211.20.14.156|211-20-14-156.hinet-ip.hinet.net|7
211.253.9.49|-|7
213.55.85.202|-|7
216.172.190.206|col.colettelounge.com|7
218.64.218.2|-|7
223.98.188.122|-|7
