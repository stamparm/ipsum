![Logo](https://i.imgur.com/PyKLAe7.png)

[![License](https://img.shields.io/badge/license-The_Unlicense-red.svg)](https://unlicense.org/)

About
----

**IPsum** is a threat intelligence feed based on 30+ different publicly available [lists](https://github.com/stamparm/maltrail) of suspicious and/or malicious IP addresses. All lists are automatically retrieved and parsed on a daily (every 24 hours) basis and the final result is pushed to this repository. The feed contains IP addresses plus an occurrence count (how many source lists each IP appears on). Higher counts generally mean higher confidence and fewer false positives when blocking inbound traffic. Also, list is sorted by occurrence count (highest to lowest).

As an example, to get a fresh and ready-to-deploy auto-ban list of "bad IPs" that appear on at least 3 (black)lists you can run:

```
curl -fsSL https://raw.githubusercontent.com/stamparm/ipsum/master/ipsum.txt 2>/dev/null | grep -v "^#" | grep -Ev '[[:space:]]([12])$' | cut -f 1
```

If you want to try it with `ipset`, you can do the following:

```
sudo -i
apt-get update && apt-get install -y iptables ipset
ipset -q flush ipsum
ipset -q create ipsum hash:ip
for ip in $(curl https://raw.githubusercontent.com/stamparm/ipsum/master/ipsum.txt 2>/dev/null | grep -v "#" | grep -Ev '[[:space:]]([12])$' | cut -f 1); do ipset add ipsum $ip; done
iptables -D INPUT -m set --match-set ipsum src -j DROP 2>/dev/null
iptables -I INPUT -m set --match-set ipsum src -j DROP
```

In directory [levels](levels) you can find preprocessed raw IP lists based on number of blacklist occurrences (e.g. [levels/3.txt](levels/3.txt) holds IP addresses that can be found on 3 or more blacklists).

Wall of Shame (2026-03-22)
----

|IP|DNS lookup|Number of (black)lists|
|---|---|--:|
2.57.121.25|hosting25.tronicsat.com|10
2.57.121.112|dns112.personaliseplus.com|10
185.91.69.217|-|10
213.209.159.159|-|10
80.82.77.33|sky.census.shodan.io|9
80.82.77.139|dojo.census.shodan.io|9
114.111.54.188|-|9
209.166.46.147|209-166-46-147.client.dsl.net|9
45.91.64.7|scan.f6.security|8
45.148.10.121|-|8
66.132.153.124|124.153.132.66.censys-scanner.com|8
66.240.192.138|census8.shodan.io|8
71.6.135.131|soda.census.shodan.io|8
74.208.174.21|ip74-208-174-21.pbiaas.com|8
80.94.95.115|-|8
82.158.224.77|-|8
86.54.31.38|blue2.census.shodan.io|8
91.208.206.75|system-patch-node.net|8
91.224.92.22|srv-91-224-92-22.minehost.eu|8
93.174.95.106|battery.census.shodan.io|8
101.36.104.242|-|8
103.61.122.229|-|8
125.17.108.32|server.serverinfo.in.net|8
134.65.30.157|-|8
144.31.158.92|-|8
147.45.60.22|151798.ip-ptr.tech|8
152.32.162.42|-|8
162.142.125.220|220.125.142.162.censys-scanner.com|8
163.7.8.88|-|8
167.94.146.62|62.146.94.167.censys-scanner.com|8
185.156.73.233|-|8
185.242.3.105|-|8
210.211.122.97|-|8
217.154.69.208|-|8
2.57.121.50|smtp50.kcmoa.com|7
2.57.122.238|-|7
3.143.162.210|scan.visionheight.com|7
5.101.64.6|scan.f6.security|7
14.63.217.28|-|7
14.116.156.100|-|7
27.79.1.111|localhost|7
36.64.68.99|-|7
36.154.50.214|-|7
37.120.213.13|-|7
43.224.126.132|-|7
43.252.231.122|-|7
45.66.228.255|iceberg.30x.ru|7
45.120.216.232|-|7
45.205.1.8|-|7
47.180.114.229|47-180-114-229.944e76fe48b133ae6f88b784db937d44.ip.frontiernet.net|7
50.84.211.204|syn-050-084-211-204.biz.spectrum.com|7
51.75.194.10|vps-f8f463b5.vps.ovh.net|7
58.222.244.226|-|7
61.182.2.26|-|7
62.171.160.177|mail.fidelity-risklogin.com|7
64.62.156.152|-|7
66.132.153.115|115.153.132.66.censys-scanner.com|7
66.132.153.122|122.153.132.66.censys-scanner.com|7
66.132.153.125|125.153.132.66.censys-scanner.com|7
66.132.153.126|126.153.132.66.censys-scanner.com|7
66.132.153.128|128.153.132.66.censys-scanner.com|7
66.132.153.141|141.153.132.66.censys-scanner.com|7
66.132.153.142|142.153.132.66.censys-scanner.com|7
66.132.172.101|101.172.132.66.censys-scanner.com|7
66.132.172.135|135.172.132.66.censys-scanner.com|7
66.132.172.143|143.172.132.66.censys-scanner.com|7
68.233.116.124|-|7
80.94.92.171|-|7
80.94.92.184|-|7
80.94.95.116|-|7
81.183.192.244|51B7C0F4.dsl.pool.telekom.hu|7
82.24.64.32|-|7
85.18.236.229|85-18-236-229.ip.fastwebnet.it|7
86.54.31.32|hat.census.shodan.io|7
86.54.31.34|wine.census.shodan.io|7
86.54.31.42|green.census.shodan.io|7
87.106.91.226|-|7
89.248.167.131|mason.census.shodan.io|7
91.224.92.50|imize2.writeresaychooseboltsnow.com|7
92.27.101.99|host-92-27-101-99.static.as13285.net|7
92.118.39.56|-|7
92.118.39.72|-|7
92.118.39.76|-|7
92.154.95.236|lstlambert-656-1-48-236.w92-154.abo.wanadoo.fr|7
94.102.49.193|cloud.census.shodan.io|7
95.58.255.251|95.58.255.251.static.telecom.kz|7
95.85.234.50|instance219590.waicore.network|7
95.215.0.144|scan.f6.security|7
101.47.158.137|-|7
103.48.192.48|-|7
103.148.100.146|-|7
103.175.207.96|-|7
106.13.224.150|-|7
111.119.220.50|ecs-111-119-220-50.compute.hwclouds-dns.com|7
115.140.161.61|-|7
115.241.83.2|-|7
116.34.14.135|-|7
116.110.212.243|-|7
116.110.223.172|-|7
119.96.157.188|-|7
121.165.84.80|-|7
122.168.194.41|abts-mp-static-041.194.168.122.airtelbroadband.in|7
125.212.226.17|-|7
138.124.67.78|-|7
139.19.117.130|inet-research-scan-6.mpi-inf.mpg.de|7
144.31.11.68|-|7
144.31.137.41|vm417920.hosted-by.u1host.com|7
147.182.194.60|-|7
160.174.129.232|-|7
161.132.19.69|bora.yachay.pe|7
162.142.125.37|37.125.142.162.censys-scanner.com|7
162.142.125.46|46.125.142.162.censys-scanner.com|7
162.142.125.113|113.125.142.162.censys-scanner.com|7
162.142.125.116|116.125.142.162.censys-scanner.com|7
162.142.125.117|117.125.142.162.censys-scanner.com|7
162.142.125.121|121.125.142.162.censys-scanner.com|7
162.142.125.126|126.125.142.162.censys-scanner.com|7
162.142.125.199|199.125.142.162.censys-scanner.com|7
162.142.125.201|201.125.142.162.censys-scanner.com|7
162.142.125.203|203.125.142.162.censys-scanner.com|7
162.142.125.205|205.125.142.162.censys-scanner.com|7
162.142.125.214|214.125.142.162.censys-scanner.com|7
162.142.125.215|215.125.142.162.censys-scanner.com|7
162.142.125.218|218.125.142.162.censys-scanner.com|7
162.142.125.221|221.125.142.162.censys-scanner.com|7
162.142.125.222|222.125.142.162.censys-scanner.com|7
163.7.1.156|-|7
165.154.105.128|-|7
165.154.227.162|-|7
167.94.138.50|50.138.94.167.censys-scanner.com|7
167.94.138.115|115.138.94.167.censys-scanner.com|7
167.94.138.118|118.138.94.167.censys-scanner.com|7
167.94.146.49|49.146.94.167.censys-scanner.com|7
167.94.146.52|52.146.94.167.censys-scanner.com|7
167.94.146.54|54.146.94.167.censys-scanner.com|7
167.94.146.55|55.146.94.167.censys-scanner.com|7
167.94.146.57|57.146.94.167.censys-scanner.com|7
167.94.146.60|60.146.94.167.censys-scanner.com|7
167.94.146.61|61.146.94.167.censys-scanner.com|7
168.167.228.74|-|7
171.244.37.103|-|7
175.200.104.40|-|7
176.32.195.85|scan.f6.security|7
176.120.22.17|-|7
177.229.197.38|customer-MCA-TGZ-197-38.megared.net.mx|7
178.130.46.2|175197.ip-ptr.tech|7
179.32.33.161|-|7
185.177.72.30|-|7
185.246.130.20|-|7
185.247.184.146|145987.ip-ptr.tech|7
187.16.96.250|mvx-187-16-96-250.mundivox.com|7
189.217.130.86|customer-189-217-130-86.cablevision.net.mx|7
190.129.122.185|-|7
192.109.200.219|materialoranges.ptr.network|7
193.46.255.86|hostingmailto239.statics.servermail.org|7
193.121.51.31|31.51-121-193.fia-dyn.isp.proximus.be|7
195.178.110.199|-|7
197.211.55.20|-|7
197.221.232.44|16.44.telone.co.zw|7
197.227.8.186|-|7
201.17.133.138|c911858a.virtua.com.br|7
202.51.214.99|-|7
203.0.104.170|-|7
203.150.107.244|244.107.150.203.sta.inet.co.th|7
206.168.34.39|39.34.168.206.censys-scanner.com|7
206.168.34.120|120.34.168.206.censys-scanner.com|7
211.223.41.90|-|7
211.253.9.49|-|7
213.209.159.158|-|7
216.180.246.65|crawler065.deepfield.net|7
218.145.181.48|-|7
218.149.235.152|-|7
220.80.223.144|-|7
220.247.223.56|56.sta.idc-2.slt.lk|7
