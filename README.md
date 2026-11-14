![Logo](https://i.imgur.com/PyKLAe7.png)

[![License](https://img.shields.io/badge/license-The_Unlicense-red.svg)](https://unlicense.org/)

About
----

**IPsum** is a threat intelligence feed based on 30+ different publicly available [lists](https://github.com/stamparm/maltrail) of suspicious and/or malicious IP addresses, like [IPnoise](https://ipnoise.sekuripy.hr/). All lists are automatically retrieved and parsed on a daily (every 24 hours) basis and the final result is pushed to this repository. The feed contains IP addresses plus an occurrence count (how many source lists each IP appears on). Higher counts generally mean higher confidence and fewer false positives when blocking inbound traffic. Also, list is sorted by occurrence count (highest to lowest).

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

Wall of Shame (2026-11-14)
----

|IP|DNS lookup|Number of (black)lists|
|---|---|--:|
45.148.10.151|-|11
45.148.10.152|-|10
138.226.239.233|-|10
138.226.239.234|-|10
45.148.10.141|-|9
45.148.10.157|-|9
125.130.102.172|-|9
201.86.42.211|201.86.42.211.dynamic.adsl.gvt.net.br|9
18.218.118.203|scan.visionheight.com|8
35.210.44.49|49.44.210.35.bc.googleusercontent.com|8
35.210.116.204|204.116.210.35.bc.googleusercontent.com|8
35.210.176.28|28.176.210.35.bc.googleusercontent.com|8
64.62.197.107|-|8
79.3.96.178|host-79-3-96-178.business.telecomitalia.it|8
81.181.129.218|-|8
92.27.101.99|host-92-27-101-99.static.as13285.net|8
103.159.2.113|-|8
167.94.146.59|59.146.94.167.censys-scanner.com|8
179.43.153.2|undefined.hostname.localhost|8
179.43.153.18|undefined.hostname.localhost|8
193.32.162.15|-|8
203.55.81.2|-|8
220.80.223.144|-|8
2.57.121.112|dns112.personaliseplus.com|7
2.57.122.209|-|7
3.129.187.38|scan.visionheight.com|7
12.156.67.18|-|7
14.54.22.11|-|7
18.116.101.220|scan.visionheight.com|7
31.57.34.150|ip-150.34.57.31.ptr.servcity.org|7
35.210.19.110|110.19.210.35.bc.googleusercontent.com|7
35.210.19.131|131.19.210.35.bc.googleusercontent.com|7
35.210.38.107|107.38.210.35.bc.googleusercontent.com|7
35.210.54.75|75.54.210.35.bc.googleusercontent.com|7
35.210.65.254|254.65.210.35.bc.googleusercontent.com|7
35.210.83.117|117.83.210.35.bc.googleusercontent.com|7
35.210.122.110|110.122.210.35.bc.googleusercontent.com|7
35.210.140.20|20.140.210.35.bc.googleusercontent.com|7
35.210.191.203|203.191.210.35.bc.googleusercontent.com|7
35.210.205.101|101.205.210.35.bc.googleusercontent.com|7
35.210.226.156|156.226.210.35.bc.googleusercontent.com|7
36.66.16.233|-|7
45.112.50.36|static-45-112-50-36.pol.net.in|7
45.148.10.5|-|7
45.148.10.233|-|7
45.156.87.78|-|7
45.156.129.80|sh-chi-us-gp1-wk105a.internet-census.org|7
46.151.178.14|-|7
49.0.87.123|49-0-87-0.24.fixed-public.twa-bng.myaisfibre.com|7
50.6.192.84|50-6-192-84.unifiedlayer.com|7
58.182.58.128|-|7
58.221.60.25|-|7
58.222.244.226|-|7
61.177.36.109|-|7
64.62.197.77|-|7
64.62.197.92|-|7
64.62.197.122|-|7
64.62.197.227|-|7
66.132.159.102|102.159.132.66.censys-scanner.com|7
66.132.159.133|133.159.132.66.censys-scanner.com|7
66.132.172.45|45.172.132.66.censys-scanner.com|7
66.132.172.136|136.172.132.66.censys-scanner.com|7
66.132.172.183|183.172.132.66.censys-scanner.com|7
66.132.172.188|188.172.132.66.censys-scanner.com|7
66.132.195.74|74.195.132.66.censys-scanner.com|7
66.132.195.82|82.195.132.66.censys-scanner.com|7
68.58.224.106|c-68-58-224-106.hsd1.mi.comcast.net|7
71.6.134.231|-|7
78.128.112.74|ip-112-74.4vendeta.com|7
83.233.255.240|83-233-255-240.cust.bredband2.com|7
83.239.84.130|-|7
92.27.157.252|host-92-27-157-252.static.as13285.net|7
92.118.39.49|-|7
93.152.221.51|-|7
95.188.91.101|-|7
96.1.40.151|96-1-40-151-staticipeast.wireless.telus.com|7
98.142.247.53|-|7
101.47.158.56|-|7
102.220.45.186|-|7
103.233.206.154|-|7
104.244.79.113|-|7
107.150.123.48|-|7
111.238.174.6|KD111238174006.ppp-bb.dion.ne.jp|7
118.36.222.243|-|7
118.145.239.129|-|7
118.193.45.134|-|7
119.96.173.169|-|7
119.204.122.94|-|7
119.246.15.94|119246015094.ctinets.com|7
136.228.161.66|-|7
144.217.241.75|vps-d4789e8c.vps.ovh.ca|7
147.185.132.16|-|7
147.185.132.27|-|7
147.185.132.52|-|7
147.185.132.58|-|7
147.185.132.76|-|7
147.185.132.81|-|7
147.185.132.93|-|7
147.185.132.97|-|7
147.185.132.100|-|7
147.185.132.103|-|7
147.185.132.111|-|7
147.185.132.162|-|7
147.185.132.174|-|7
147.185.132.189|-|7
147.185.132.255|-|7
147.185.133.72|-|7
147.185.133.123|-|7
150.138.115.76|-|7
151.243.11.106|-|7
152.32.236.102|-|7
165.154.255.63|-|7
167.94.146.49|49.146.94.167.censys-scanner.com|7
167.94.146.57|57.146.94.167.censys-scanner.com|7
167.94.146.62|62.146.94.167.censys-scanner.com|7
167.94.146.63|63.146.94.167.censys-scanner.com|7
171.100.156.38|mail.sotus.co.th|7
171.104.143.176|-|7
176.32.193.16|-|7
177.10.203.106|106.203.10.177.isptec.com.br|7
179.43.153.10|undefined.hostname.localhost|7
179.185.227.77|grupokrause.static.gvt.net.br|7
180.70.154.248|-|7
182.93.50.90|n18293z50l90.static.ctmip.net|7
185.136.205.169|-|7
185.230.216.5|ip185-230-216-5.pbiaas.com|7
187.8.120.90|187-8-120-90.customer.tdatabrasil.net.br|7
190.105.160.5|-|7
193.47.62.69|-|7
193.47.62.111|-|7
196.188.93.169|-|7
196.189.236.67|-|7
197.227.8.186|-|7
199.165.159.41|scan-95-0.shadowserver.io|7
199.165.159.65|scan-98-0.shadowserver.io|7
199.165.159.153|scan-82-0.shadowserver.io|7
200.37.103.36|-|7
209.99.190.186|-|7
213.209.159.175|-|7
219.150.93.157|-|7
