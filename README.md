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

Wall of Shame (2026-03-07)
----

|IP|DNS lookup|Number of (black)lists|
|---|---|--:|
2.57.121.25|hosting25.tronicsat.com|11
2.57.121.112|dns112.personaliseplus.com|11
213.209.159.159|-|10
43.159.36.92|-|9
45.148.10.121|-|9
45.192.96.183|-|9
91.224.92.22|srv-91-224-92-22.minehost.eu|9
91.224.92.50|imize2.writeresaychooseboltsnow.com|9
154.81.14.244|-|9
185.156.73.233|-|9
213.209.159.158|-|9
12.156.67.18|-|8
18.218.118.203|scan.visionheight.com|8
45.15.224.178|-|8
64.89.160.47|-|8
66.132.153.130|130.153.132.66.censys-scanner.com|8
69.5.20.239|-|8
80.94.92.171|-|8
82.24.64.32|-|8
82.158.224.115|-|8
91.224.92.191|srv-91-224-92-191.serveroffer.net|8
92.118.39.56|-|8
92.118.39.95|-|8
101.36.118.177|-|8
107.150.119.229|-|8
125.17.108.32|server.serverinfo.in.net|8
130.12.180.103|-|8
130.12.181.151|-|8
130.12.181.157|-|8
134.65.30.157|-|8
141.98.11.155|srv-141-98-11-155.serveroffer.net|8
141.98.11.166|srv-141-98-11-166.serveroffer.net|8
144.79.133.252|-|8
165.245.168.176|-|8
167.94.146.60|60.146.94.167.censys-scanner.com|8
176.120.22.47|-|8
185.91.69.217|-|8
195.178.110.15|-|8
220.80.223.144|-|8
1.55.33.86|-|7
3.129.187.38|scan.visionheight.com|7
3.131.220.121|scan.visionheight.com|7
5.101.64.6|scan.f6.security|7
14.29.198.130|-|7
14.116.156.100|-|7
20.59.121.110|-|7
24.139.85.223|-|7
34.85.163.94|94.163.85.34.bc.googleusercontent.com|7
34.93.128.179|179.128.93.34.bc.googleusercontent.com|7
34.175.118.185|185.118.175.34.bc.googleusercontent.com|7
36.66.16.233|-|7
36.91.166.34|-|7
45.91.64.7|scan.f6.security|7
45.120.216.232|-|7
45.121.147.48|briskgriffin.info|7
45.148.10.141|-|7
45.148.10.147|-|7
45.148.10.151|-|7
45.148.10.152|-|7
45.148.10.192|-|7
45.153.34.213|-|7
45.153.34.226|-|7
45.249.245.88|-|7
47.180.114.229|47-180-114-229.944e76fe48b133ae6f88b784db937d44.ip.frontiernet.net|7
50.84.211.204|syn-050-084-211-204.biz.spectrum.com|7
51.75.141.245|vps-07dfa8e6.vps.ovh.net|7
51.158.120.121|121-120-158-51.instances.scw.cloud|7
51.222.30.51|itop.sidc.com.sa|7
51.254.103.32|vps-738c7547.vps.ovh.net|7
57.128.190.44|vps-b45b3ce9.vps.ovh.net|7
57.129.74.123|vps-6999196f.vps.ovh.net|7
59.12.160.91|-|7
59.98.83.57|-|7
61.111.244.152|-|7
64.89.161.182|-|7
66.132.153.128|128.153.132.66.censys-scanner.com|7
66.132.153.136|136.153.132.66.censys-scanner.com|7
66.132.153.140|140.153.132.66.censys-scanner.com|7
68.233.116.124|-|7
80.82.70.133|rnd.group-ib.com|7
80.82.77.139|dojo.census.shodan.io|7
80.94.92.184|-|7
80.94.95.115|-|7
80.94.95.116|-|7
80.253.31.232|-|7
82.165.66.87|ip82-165-66-87.pbiaas.com|7
83.168.71.160|-|7
85.217.149.64|o064.scanner.modat.io|7
86.54.31.38|blue2.census.shodan.io|7
88.18.209.3|3.red-88-18-209.staticip.rima-tde.net|7
88.142.46.185|185.46.142.88.rev.sfr.net|7
89.47.53.19|-|7
91.224.92.54|ascrl6.writeresaychooseboltsnow.com|7
92.118.39.72|-|7
92.118.39.76|-|7
93.174.95.106|battery.census.shodan.io|7
94.26.106.200|-|7
94.26.106.201|-|7
95.167.225.76|-|7
101.36.104.242|-|7
101.36.107.228|-|7
101.36.125.11|-|7
101.36.126.70|-|7
103.49.238.104|ip103-49-238-104.cloudhost.web.id|7
103.88.32.226|-|7
103.98.176.164|-|7
103.148.100.146|-|7
103.175.225.238|-|7
103.182.132.154|-|7
103.210.22.17|-|7
103.237.144.204|-|7
112.196.70.142|-|7
114.220.75.156|-|7
115.140.161.61|-|7
115.231.78.11|-|7
119.96.173.169|-|7
121.165.204.105|-|7
123.58.213.127|-|7
125.21.59.218|-|7
130.12.180.95|-|7
130.12.180.107|-|7
130.12.182.185|-|7
130.61.28.82|-|7
137.184.14.106|-|7
138.2.0.137|-|7
139.19.117.130|inet-research-scan-6.mpi-inf.mpg.de|7
144.31.11.68|-|7
144.48.8.10|-|7
146.190.147.62|-|7
147.185.132.105|-|7
151.80.61.151|vps-5d95afd4.vps.ovh.net|7
152.32.188.177|quudquu.cn|7
154.125.147.88|-|7
154.221.27.234|-|7
157.245.193.43|-|7
159.223.45.78|-|7
159.223.196.229|-|7
161.49.89.39|161.49.89.39.convergeict.com|7
162.142.125.34|34.125.142.162.censys-scanner.com|7
162.142.125.119|119.125.142.162.censys-scanner.com|7
162.142.125.195|195.125.142.162.censys-scanner.com|7
162.142.125.199|199.125.142.162.censys-scanner.com|7
162.142.125.204|204.125.142.162.censys-scanner.com|7
162.142.125.220|220.125.142.162.censys-scanner.com|7
165.22.106.85|-|7
165.154.6.49|-|7
165.154.227.162|-|7
167.71.115.113|-|7
167.94.146.48|48.146.94.167.censys-scanner.com|7
167.94.146.50|50.146.94.167.censys-scanner.com|7
167.94.146.52|52.146.94.167.censys-scanner.com|7
167.94.146.53|53.146.94.167.censys-scanner.com|7
167.94.146.55|55.146.94.167.censys-scanner.com|7
167.94.146.57|57.146.94.167.censys-scanner.com|7
167.94.146.58|58.146.94.167.censys-scanner.com|7
167.94.146.63|63.146.94.167.censys-scanner.com|7
168.167.228.74|-|7
170.238.160.191|-|7
176.65.132.218|-|7
176.120.22.13|-|7
178.62.207.223|-|7
178.217.173.50|-|7
180.100.217.164|-|7
181.81.157.200|host200.181-81-157.telecom.net.ar|7
183.81.33.183|-|7
183.82.126.193|183.82.126.193.actcorp.in|7
187.45.100.0|-|7
188.128.75.50|-|7
193.32.162.151|-|7
196.189.237.92|-|7
197.5.145.8|-|7
199.45.154.147|147.154.45.199.censys-scanner.com|7
199.45.154.157|157.154.45.199.censys-scanner.com|7
199.45.155.75|75.155.45.199.censys-scanner.com|7
200.196.50.91|mvx-200-196-50-91.mundivox.com|7
201.49.108.245|201-49-108-245.static.ctbctelecom.com.br|7
201.149.53.243|service-static-149.53.243.mcm-telecom.com.mx|7
201.249.89.102|201-249-89-102-bto-00.rai.cantv.net|7
202.51.214.99|-|7
202.70.82.95|-|7
203.23.199.88|-|7
203.150.107.244|244.107.150.203.sta.inet.co.th|7
205.185.125.150|-|7
205.210.31.174|-|7
206.168.34.32|32.34.168.206.censys-scanner.com|7
206.168.34.40|40.34.168.206.censys-scanner.com|7
206.168.34.43|43.34.168.206.censys-scanner.com|7
206.168.34.58|58.34.168.206.censys-scanner.com|7
206.168.34.115|115.34.168.206.censys-scanner.com|7
206.168.34.124|124.34.168.206.censys-scanner.com|7
210.211.122.97|-|7
218.145.181.48|-|7
220.247.223.56|56.sta.idc-2.slt.lk|7
221.159.150.85|-|7
