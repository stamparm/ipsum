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

Wall of Shame (2026-03-01)
----

|IP|DNS lookup|Number of (black)lists|
|---|---|--:|
45.148.10.141|-|10
154.81.14.244|-|10
45.148.10.192|-|9
66.132.153.124|124.153.132.66.censys-scanner.com|9
80.82.77.139|dojo.census.shodan.io|9
92.118.39.76|-|9
93.174.95.106|battery.census.shodan.io|9
101.36.104.242|-|9
101.36.123.102|-|9
103.40.61.98|-|9
144.79.133.252|-|9
185.91.69.217|-|9
195.178.110.15|-|9
2.57.121.25|hosting25.tronicsat.com|8
2.57.121.112|dns112.personaliseplus.com|8
18.218.118.203|scan.visionheight.com|8
45.148.10.121|-|8
45.148.10.151|-|8
45.148.10.152|-|8
45.148.10.157|-|8
45.192.96.183|-|8
61.245.11.87|-|8
66.132.153.123|123.153.132.66.censys-scanner.com|8
71.6.135.131|soda.census.shodan.io|8
71.6.158.166|ninja.census.shodan.io|8
71.6.165.200|census12.shodan.io|8
71.6.199.23|einstein.census.shodan.io|8
80.94.92.171|-|8
83.168.68.72|hosted-by.SkillHost.PL|8
85.8.182.98|unknown.imidc.com|8
86.54.31.38|blue2.census.shodan.io|8
91.224.92.54|ascrl6.writeresaychooseboltsnow.com|8
91.224.92.190|srv-91-224-92-190.serveroffer.net|8
92.118.39.56|-|8
101.36.118.177|-|8
103.252.73.37|-|8
128.241.229.30|-|8
130.12.180.103|-|8
141.98.11.83|srv-141-98-11-83.serveroffer.net|8
146.70.146.50|-|8
161.132.37.26|-|8
162.142.125.118|118.125.142.162.censys-scanner.com|8
167.94.146.49|49.146.94.167.censys-scanner.com|8
167.94.146.58|58.146.94.167.censys-scanner.com|8
167.94.146.62|62.146.94.167.censys-scanner.com|8
167.94.146.63|63.146.94.167.censys-scanner.com|8
170.238.160.191|-|8
199.45.155.91|91.155.45.199.censys-scanner.com|8
210.211.122.97|-|8
218.145.181.48|-|8
2.57.122.210|-|7
2.57.122.238|-|7
3.131.220.121|scan.visionheight.com|7
5.101.64.6|scan.f6.security|7
12.156.67.18|-|7
23.95.62.123|23-95-62-123-host.colocrossing.com|7
24.65.233.27|S0106000fff9fa308.ed.shawcable.net|7
27.111.32.174|-|7
34.85.163.94|94.163.85.34.bc.googleusercontent.com|7
34.175.118.185|185.118.175.34.bc.googleusercontent.com|7
43.159.36.92|-|7
43.160.207.2|-|7
43.162.97.123|-|7
43.226.44.46|-|7
45.81.23.49|-|7
45.148.10.147|-|7
45.175.37.18|-|7
45.249.245.88|-|7
51.75.194.10|vps-f8f463b5.vps.ovh.net|7
51.75.253.68|vps-94085b09.vps.ovh.net|7
51.81.208.33|ns1009013.ip-51-81-208.us|7
59.12.160.91|-|7
60.199.224.2|60-199-224-2.static.tfn.net.tw|7
64.89.160.82|-|7
66.132.153.118|118.153.132.66.censys-scanner.com|7
66.132.153.127|127.153.132.66.censys-scanner.com|7
66.132.153.128|128.153.132.66.censys-scanner.com|7
66.132.153.133|133.153.132.66.censys-scanner.com|7
66.132.153.141|141.153.132.66.censys-scanner.com|7
66.132.153.142|142.153.132.66.censys-scanner.com|7
71.6.134.233|centos7134233.aspadmin.net|7
80.94.92.184|-|7
80.253.31.232|-|7
81.211.72.167|-|7
82.165.66.87|ip82-165-66-87.pbiaas.com|7
83.168.105.145|hosted-by.skillhost.pl|7
86.54.31.34|wine.census.shodan.io|7
86.54.31.42|green.census.shodan.io|7
89.248.167.131|mason.census.shodan.io|7
91.202.233.33|-|7
95.58.255.251|95.58.255.251.static.telecom.kz|7
95.167.225.76|-|7
103.49.238.104|ip103-49-238-104.cloudhost.web.id|7
103.103.245.7|-|7
103.113.105.228|-|7
103.120.227.88|-|7
103.171.84.251|ip103-171-84-251.cloudhost.web.id|7
103.188.177.46|-|7
103.239.252.132|mail.carnival.com.bd|7
109.172.55.64|143005.ip-ptr.tech|7
115.140.161.61|-|7
118.70.178.158|-|7
118.193.57.62|-|7
119.18.55.118|119-18-55-118.webhostbox.net|7
121.165.204.105|-|7
125.21.59.218|-|7
135.148.9.11|ip11.ip-135-148-9.us|7
138.124.67.78|-|7
143.64.168.136|-|7
144.91.93.174|vmi3106341.contaboserver.net|7
144.217.13.134|vps-2cf81da8.vps.ovh.ca|7
150.107.38.251|-|7
151.80.61.151|vps-5d95afd4.vps.ovh.net|7
152.228.131.33|vps-a34f1667.vps.ovh.net|7
159.146.11.164|-|7
162.142.125.35|35.125.142.162.censys-scanner.com|7
162.142.125.112|112.125.142.162.censys-scanner.com|7
162.142.125.113|113.125.142.162.censys-scanner.com|7
162.142.125.115|115.125.142.162.censys-scanner.com|7
162.142.125.120|120.125.142.162.censys-scanner.com|7
162.142.125.121|121.125.142.162.censys-scanner.com|7
162.142.125.122|122.125.142.162.censys-scanner.com|7
162.142.125.124|124.125.142.162.censys-scanner.com|7
162.142.125.202|202.125.142.162.censys-scanner.com|7
162.142.125.204|204.125.142.162.censys-scanner.com|7
162.142.125.206|206.125.142.162.censys-scanner.com|7
162.142.125.208|208.125.142.162.censys-scanner.com|7
162.142.125.210|210.125.142.162.censys-scanner.com|7
162.142.125.214|214.125.142.162.censys-scanner.com|7
162.142.125.219|219.125.142.162.censys-scanner.com|7
165.154.105.128|-|7
167.94.138.178|178.138.94.167.censys-scanner.com|7
167.94.138.192|192.138.94.167.censys-scanner.com|7
167.94.138.193|193.138.94.167.censys-scanner.com|7
167.94.146.48|48.146.94.167.censys-scanner.com|7
167.94.146.51|51.146.94.167.censys-scanner.com|7
167.94.146.53|53.146.94.167.censys-scanner.com|7
167.94.146.56|56.146.94.167.censys-scanner.com|7
167.94.146.57|57.146.94.167.censys-scanner.com|7
167.94.146.59|59.146.94.167.censys-scanner.com|7
167.94.146.61|61.146.94.167.censys-scanner.com|7
171.244.37.103|-|7
175.107.32.186|-|7
176.65.134.22|176.65.134.22|7
176.213.141.182|176x213x141x182.dynamic.rostov.ertelecom.ru|7
180.76.172.156|-|7
182.18.161.165|static-182-18-161-165.ctrls.in|7
182.93.50.90|n18293z50l90.static.ctmip.net|7
183.82.126.193|183.82.126.193.actcorp.in|7
185.107.80.93|-|7
188.166.29.28|docs.getxray.app-staging|7
189.217.130.86|customer-189-217-130-86.cablevision.net.mx|7
190.167.237.191|191.237.167.190.l.static.claro.net.do|7
193.32.162.145|-|7
196.188.93.169|-|7
197.5.145.102|-|7
201.76.120.30|30.120.76.201.in-addr.arpa.verointernet.com.br|7
202.70.82.95|-|7
203.121.40.210|-|7
211.253.9.49|-|7
213.209.159.159|-|7
220.80.223.144|-|7
220.247.223.56|56.sta.idc-2.slt.lk|7
220.247.224.226|-|7
221.159.150.85|-|7
222.107.156.227|-|7
222.121.250.156|-|7
