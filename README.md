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

Wall of Shame (2026-01-29)
----

|IP|DNS lookup|Number of (black)lists|
|---|---|--:|
80.94.92.184|-|10
85.111.68.98|85.111.68.98.dynamic.ttnet.com.tr|10
213.209.159.158|-|10
45.148.10.152|-|9
61.245.11.87|-|9
66.132.153.134|134.153.132.66.censys-scanner.com|9
80.82.77.33|sky.census.shodan.io|9
80.94.92.171|-|9
91.224.92.78|srv-91-224-92-78.serveroffer.net|9
92.118.39.56|-|9
92.118.39.72|-|9
167.94.146.62|62.146.94.167.censys-scanner.com|9
213.209.159.159|-|9
2.57.122.238|-|8
3.130.96.91|scan.cypex.ai|8
35.222.117.243|243.117.222.35.bc.googleusercontent.com|8
37.120.213.13|-|8
45.148.10.141|-|8
45.148.10.147|-|8
59.12.160.91|-|8
71.6.135.131|soda.census.shodan.io|8
71.6.165.200|census12.shodan.io|8
80.82.77.139|dojo.census.shodan.io|8
91.224.92.108|srv-91-224-92-108.serveroffer.net|8
91.224.92.190|srv-91-224-92-190.serveroffer.net|8
92.118.39.76|-|8
94.102.49.193|cloud.census.shodan.io|8
101.36.104.242|-|8
101.36.107.228|-|8
103.236.95.173|-|8
103.252.73.37|-|8
152.53.184.147|v2202511309730395704.goodsrv.de|8
162.142.125.112|112.125.142.162.censys-scanner.com|8
162.142.125.210|210.125.142.162.censys-scanner.com|8
162.142.125.211|211.125.142.162.censys-scanner.com|8
167.94.146.52|52.146.94.167.censys-scanner.com|8
167.94.146.54|54.146.94.167.censys-scanner.com|8
167.94.146.60|60.146.94.167.censys-scanner.com|8
176.65.134.22|176.65.134.22|8
193.32.162.145|-|8
195.40.154.8|-|8
204.76.203.233|204.76.203.233.ptr.pfcloud.network|8
206.168.34.33|33.34.168.206.censys-scanner.com|8
206.168.34.48|48.34.168.206.censys-scanner.com|8
206.168.34.121|121.34.168.206.censys-scanner.com|8
2.57.122.210|-|7
3.134.148.59|scan.cypex.ai|7
3.143.33.63|scan.cypex.ai|7
3.149.59.26|scan.cypex.ai|7
5.42.239.222|-|7
36.64.68.99|-|7
36.139.226.237|-|7
38.248.14.48|-|7
41.223.40.78|-|7
45.91.64.6|-|7
45.121.147.47|-|7
45.148.10.121|-|7
45.148.10.151|-|7
45.148.10.157|-|7
45.156.87.225|-|7
45.162.8.14|-|7
45.175.37.18|-|7
45.175.37.29|-|7
45.227.254.170|-|7
47.180.114.229|47-180-114-229.944e76fe48b133ae6f88b784db937d44.ip.frontiernet.net|7
47.254.192.177|-|7
51.75.194.10|vps-f8f463b5.vps.ovh.net|7
51.195.42.66|vps-46f7560c.vps.ovh.net|7
54.38.190.246|vps-3d2e1516.vps.ovh.net|7
60.241.212.36|60-241-212-36.static.tpgi.com.au|7
62.193.106.227|-|7
64.62.197.77|-|7
64.62.197.92|-|7
66.132.153.113|113.153.132.66.censys-scanner.com|7
66.132.153.119|119.153.132.66.censys-scanner.com|7
66.132.153.122|122.153.132.66.censys-scanner.com|7
66.132.153.124|124.153.132.66.censys-scanner.com|7
66.132.153.126|126.153.132.66.censys-scanner.com|7
66.132.153.141|141.153.132.66.censys-scanner.com|7
66.240.192.138|census8.shodan.io|7
66.240.236.116|ubtuntu20236116.aspadmin.net|7
68.183.234.194|-|7
68.233.116.124|-|7
71.6.134.231|-|7
71.6.158.166|ninja.census.shodan.io|7
71.6.199.65|-|7
81.29.142.100|igutic.earnningipti.co.uk|7
85.69.240.210|210.240.69.85.rev.sfr.net|7
86.54.31.34|wine.census.shodan.io|7
88.142.46.185|185.46.142.88.rev.sfr.net|7
91.202.233.33|-|7
91.224.92.54|ascrl6.writeresaychooseboltsnow.com|7
91.237.163.110|-|7
91.239.148.70|-|7
92.118.39.95|-|7
92.207.4.157|-|7
93.174.95.106|battery.census.shodan.io|7
101.36.123.102|-|7
103.49.238.104|ip103-49-238-104.cloudhost.web.id|7
103.101.216.74|ip.74.216.101.103.drans.id|7
103.113.105.228|-|7
103.139.193.157|ip103-139-193-157.cloudhost.web.id|7
103.232.121.71|nick8472839|7
111.42.133.43|-|7
117.50.51.198|-|7
118.70.178.158|-|7
119.96.157.188|-|7
121.165.84.80|-|7
122.155.0.205|host1.bgs.co.th|7
128.199.157.145|-|7
130.12.180.103|-|7
130.250.191.199|ip-130-250-191-199.hosted-by-hosterdaddy.com|7
134.65.30.157|-|7
138.204.127.54|-|7
139.99.52.209|ip209.ip-139-99-52.net|7
144.217.13.134|vps-2cf81da8.vps.ovh.ca|7
148.216.255.251|-|7
151.80.118.222|222.ip-151-80-118.eu|7
152.32.188.177|quudquu.cn|7
152.32.190.168|-|7
152.228.131.33|vps-a34f1667.vps.ovh.net|7
156.238.252.133|-|7
157.254.33.117|-|7
159.89.161.111|-|7
162.142.125.32|32.125.142.162.censys-scanner.com|7
162.142.125.39|39.125.142.162.censys-scanner.com|7
162.142.125.40|40.125.142.162.censys-scanner.com|7
162.142.125.45|45.125.142.162.censys-scanner.com|7
162.142.125.46|46.125.142.162.censys-scanner.com|7
162.142.125.47|47.125.142.162.censys-scanner.com|7
162.142.125.115|115.125.142.162.censys-scanner.com|7
162.142.125.117|117.125.142.162.censys-scanner.com|7
162.142.125.121|121.125.142.162.censys-scanner.com|7
162.142.125.194|194.125.142.162.censys-scanner.com|7
162.142.125.200|200.125.142.162.censys-scanner.com|7
162.142.125.202|202.125.142.162.censys-scanner.com|7
162.142.125.212|212.125.142.162.censys-scanner.com|7
162.142.125.215|215.125.142.162.censys-scanner.com|7
162.142.125.216|216.125.142.162.censys-scanner.com|7
162.142.125.220|220.125.142.162.censys-scanner.com|7
164.90.225.61|-|7
165.90.27.250|-|7
165.154.173.104|-|7
165.227.3.79|-|7
167.94.138.46|46.138.94.167.censys-scanner.com|7
167.94.138.123|123.138.94.167.censys-scanner.com|7
167.94.138.167|167.138.94.167.censys-scanner.com|7
167.94.146.48|48.146.94.167.censys-scanner.com|7
167.94.146.50|50.146.94.167.censys-scanner.com|7
167.94.146.51|51.146.94.167.censys-scanner.com|7
167.94.146.53|53.146.94.167.censys-scanner.com|7
167.94.146.55|55.146.94.167.censys-scanner.com|7
167.94.146.58|58.146.94.167.censys-scanner.com|7
167.99.78.165|108.jobs-dev-database|7
168.167.228.74|-|7
172.96.182.111|vps.bjglobaldirect.com|7
172.105.128.11|oslo.scan.bufferover.run|7
172.105.128.13|prague.scan.bufferover.run|7
172.236.228.38|172-236-228-38.ip.linodeusercontent.com|7
172.236.228.39|172-236-228-39.ip.linodeusercontent.com|7
172.236.228.198|172-236-228-198.ip.linodeusercontent.com|7
172.236.228.224|172-236-228-224.ip.linodeusercontent.com|7
176.65.132.218|-|7
176.117.107.98|-|7
176.120.22.13|-|7
179.33.186.151|-|7
180.100.217.164|-|7
182.93.50.90|n18293z50l90.static.ctmip.net|7
185.100.157.155|-|7
185.208.156.46|onlinereportservices.report|7
185.246.128.170|-|7
187.16.96.250|mvx-187-16-96-250.mundivox.com|7
187.120.37.254|hosts-187-120-37-254.iz1telecom.com.br|7
187.210.77.100|customer-187-210-77-100.uninet-ide.com.mx|7
189.50.142.82|mail.cacp.org.br|7
189.217.130.86|customer-189-217-130-86.cablevision.net.mx|7
190.124.153.17|customer-ftth-sl-190-124-153-17.megacable.com.ar|7
192.109.200.225|flowingwall.ptr.network|7
193.32.162.82|-|7
193.32.162.157|-|7
199.45.154.141|141.154.45.199.censys-scanner.com|7
199.45.155.79|79.155.45.199.censys-scanner.com|7
199.45.155.91|91.155.45.199.censys-scanner.com|7
201.124.170.234|dsl-201-124-170-234-dyn.prod-infinitum.com.mx|7
202.70.78.237|-|7
203.228.30.198|-|7
206.168.34.36|36.34.168.206.censys-scanner.com|7
206.168.34.39|39.34.168.206.censys-scanner.com|7
206.168.34.41|41.34.168.206.censys-scanner.com|7
206.168.34.43|43.34.168.206.censys-scanner.com|7
206.168.34.45|45.34.168.206.censys-scanner.com|7
206.168.34.50|50.34.168.206.censys-scanner.com|7
206.168.34.57|57.34.168.206.censys-scanner.com|7
206.168.34.112|112.34.168.206.censys-scanner.com|7
206.168.34.113|113.34.168.206.censys-scanner.com|7
206.168.34.126|126.34.168.206.censys-scanner.com|7
206.168.34.193|193.34.168.206.censys-scanner.com|7
206.168.34.214|214.34.168.206.censys-scanner.com|7
206.168.34.219|219.34.168.206.censys-scanner.com|7
206.189.82.12|-|7
210.79.142.221|-|7
211.253.31.30|-|7
216.180.246.64|crawler064.deepfield.net|7
216.180.246.199|crawler199.deepfield.net|7
217.154.38.135|-|7
220.95.14.102|-|7
220.247.223.56|56.sta.idc-2.slt.lk|7
222.107.156.227|-|7
