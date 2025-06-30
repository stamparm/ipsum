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

Wall of Shame (2025-06-30)
----

|IP|DNS lookup|Number of (black)lists|
|---|---|--:|
193.32.162.157|-|11
45.131.155.254|-|9
185.93.89.118|-|9
195.178.110.160|-|9
218.102.217.85|pcd685085.netvigator.com|9
3.138.185.30|ec2-3-138-185-30.us-east-2.compute.amazonaws.com|8
80.82.77.33|sky.census.shodan.io|8
80.82.77.139|dojo.census.shodan.io|8
80.82.77.202|rnd.group-ib.com|8
80.94.95.15|-|8
80.94.95.115|-|8
86.1.122.70|cpc94368-ward12-2-0-cust69.10-2.cable.virginm.net|8
92.118.39.95|-|8
93.19.172.217|217.172.19.93.rev.sfr.net|8
93.123.109.191|-|8
103.39.93.93|-|8
162.142.125.200|-|8
162.142.125.205|-|8
162.142.125.206|-|8
162.142.125.217|scanner-05.ch1.censys-scanner.com|8
176.65.148.55|hosted-by.pfcloud.io|8
185.156.73.234|-|8
185.165.191.27|red.census.shodan.io|8
193.32.162.146|-|8
193.32.162.151|-|8
196.251.88.103|-|8
223.130.11.165|-|8
3.130.96.91|scan.cypex.ai|7
3.132.23.201|scan.cypex.ai|7
3.134.148.59|scan.cypex.ai|7
5.193.232.234|-|7
14.63.196.175|-|7
14.116.156.100|-|7
27.111.32.174|-|7
27.112.79.10|ip27-112-79-10.cloudhost.web.id|7
27.254.235.2|-|7
31.57.61.127|-|7
31.129.22.162|48481.ip-ptr.tech|7
40.83.182.122|-|7
45.135.193.67|-|7
58.186.71.139|58-186-71-xxx-dynamic.hcm.fpt.vn|7
60.251.120.199|60-251-120-199.hinet-ip.hinet.net|7
64.62.156.24|-|7
71.6.165.200|census12.shodan.io|7
80.94.95.116|-|7
82.199.197.245|host-245.197.199.82.ucom.am|7
83.222.191.94|-|7
85.18.236.229|85-18-236-229.ip.fastwebnet.it|7
86.54.31.40|blue.census.shodan.io|7
88.174.0.166|88-174-0-166.subs.proxad.net|7
89.97.218.142|89-97-218-142.ip19.fastwebnet.it|7
89.248.167.131|mason.census.shodan.io|7
89.248.168.227|no-reverse-dns-configured.com|7
92.118.39.62|-|7
92.154.95.236|lstlambert-656-1-48-236.w92-154.abo.wanadoo.fr|7
93.174.95.106|battery.census.shodan.io|7
94.102.49.193|cloud.census.shodan.io|7
95.85.47.10|sexolondon.com-1705306061476-s-1vcpu-2gb-ams2-01|7
95.167.225.76|-|7
95.188.91.101|-|7
96.78.175.36|-|7
101.126.91.34|-|7
103.168.135.106|-|7
103.189.234.253|ip103-189-234-253.cloudhost.web.id|7
103.237.144.204|-|7
104.244.77.50|-|7
104.248.126.21|-|7
115.231.78.11|-|7
115.241.83.2|-|7
116.172.130.191|-|7
118.40.248.20|-|7
118.70.178.158|-|7
118.145.211.128|-|7
118.193.38.102|-|7
118.194.253.212|-|7
119.96.173.169|-|7
121.52.147.5|upesh.edu.pk|7
125.17.108.32|server.serverinfo.in.net|7
125.21.59.218|-|7
136.232.98.230|-|7
136.232.203.134|-|7
139.59.64.179|-|7
139.59.188.13|-|7
142.93.116.14|-|7
152.32.250.188|-|7
154.83.12.232|-|7
156.38.18.22|-|7
159.65.173.2|-|7
162.142.125.41|-|7
162.142.125.112|scanner-19.ch1.censys-scanner.com|7
162.142.125.114|scanner-19.ch1.censys-scanner.com|7
162.142.125.115|scanner-19.ch1.censys-scanner.com|7
162.142.125.116|scanner-19.ch1.censys-scanner.com|7
162.142.125.120|scanner-20.ch1.censys-scanner.com|7
162.142.125.123|scanner-20.ch1.censys-scanner.com|7
162.142.125.125|scanner-20.ch1.censys-scanner.com|7
162.142.125.126|scanner-20.ch1.censys-scanner.com|7
162.142.125.203|-|7
162.142.125.207|-|7
162.142.125.208|scanner-28.ch1.censys-scanner.com|7
162.142.125.219|scanner-25.ch1.censys-scanner.com|7
162.142.125.220|scanner-25.ch1.censys-scanner.com|7
162.142.125.222|scanner-25.ch1.censys-scanner.com|7
167.94.138.176|-|7
167.94.138.186|-|7
167.94.138.187|-|7
167.94.138.202|-|7
167.94.145.98|-|7
167.94.146.48|-|7
167.94.146.50|-|7
167.94.146.51|-|7
167.94.146.55|-|7
167.94.146.56|-|7
167.94.146.59|-|7
167.94.146.60|-|7
167.94.146.61|-|7
167.172.162.112|-|7
170.79.37.82|-|7
172.104.11.4|jersey.scan.bufferover.run|7
176.32.195.85|-|7
176.65.148.12|hosted-by.pfcloud.io|7
176.109.80.72|-|7
177.182.181.8|b1b6b508.virtua.com.br|7
181.116.220.12|-|7
181.176.156.130|-|7
182.93.50.90|n18293z50l90.static.ctmip.net|7
185.165.191.26|purple.census.shodan.io|7
187.16.96.250|mvx-187-16-96-250.mundivox.com|7
187.45.100.0|-|7
190.85.15.251|-|7
190.111.211.81|static.81.211.111.190.cps.com.ar|7
190.129.122.86|-|7
190.167.237.191|191.237.167.190.l.static.claro.net.do|7
193.32.162.145|-|7
193.70.87.152|152.ip-193-70-87.eu|7
196.251.83.136|undefined.hostname.localhost|7
196.251.87.35|-|7
202.99.253.98|-|7
202.157.177.33|mail.simaster-brebeskab.id|7
203.150.107.244|244.107.150.203.sta.inet.co.th|7
206.168.34.79|unused-space.coop.net|7
207.167.66.226|-|7
209.126.127.230|condor2542.startdedicated.com|7
211.253.10.96|-|7
216.10.250.218|server.digitalspoint.com|7
218.29.8.41|hn.kd.ny.adsl|7
218.56.160.82|-|7
219.150.93.157|-|7
220.80.223.144|-|7
221.161.235.168|-|7
223.247.218.112|-|7
