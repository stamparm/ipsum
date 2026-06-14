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

Wall of Shame (2026-06-14)
----

|IP|DNS lookup|Number of (black)lists|
|---|---|--:|
41.63.63.211|-|9
80.82.77.139|dojo.census.shodan.io|9
190.2.135.111|190-2-135-111.hosted-by-worldstream.net|9
213.209.159.56|-|9
51.89.166.236|vps-5f0ef624.vps.ovh.net|8
66.132.195.65|65.195.132.66.censys-scanner.com|8
66.132.195.126|126.195.132.66.censys-scanner.com|8
85.111.68.99|85.111.68.99.dynamic.ttnet.com.tr|8
86.54.31.38|blue2.census.shodan.io|8
89.248.167.131|mason.census.shodan.io|8
125.20.210.182|-|8
167.94.146.60|60.146.94.167.censys-scanner.com|8
167.94.146.63|63.146.94.167.censys-scanner.com|8
176.65.139.130|-|8
1.212.225.99|-|7
2.57.121.112|dns112.personaliseplus.com|7
2.57.122.238|-|7
2.59.183.60|-|7
14.116.156.100|-|7
24.97.253.246|syn-024-097-253-246.biz.spectrum.com|7
34.124.208.70|70.208.124.34.bc.googleusercontent.com|7
35.222.117.243|243.117.222.35.bc.googleusercontent.com|7
37.120.213.13|-|7
45.148.10.121|-|7
45.148.10.141|-|7
45.148.10.151|-|7
45.172.152.74|-|7
46.101.107.202|-|7
50.84.211.204|syn-050-084-211-204.biz.spectrum.com|7
59.26.193.177|-|7
64.188.77.26|vds23168.1cent.network|7
66.132.172.131|131.172.132.66.censys-scanner.com|7
66.132.172.138|138.172.132.66.censys-scanner.com|7
66.132.186.159|159.186.132.66.censys-scanner.com|7
66.132.186.177|177.186.132.66.censys-scanner.com|7
66.132.186.191|191.186.132.66.censys-scanner.com|7
66.132.186.202|202.186.132.66.censys-scanner.com|7
66.132.186.203|203.186.132.66.censys-scanner.com|7
66.132.195.38|38.195.132.66.censys-scanner.com|7
66.132.195.51|51.195.132.66.censys-scanner.com|7
66.132.195.53|53.195.132.66.censys-scanner.com|7
66.132.195.54|54.195.132.66.censys-scanner.com|7
66.132.195.59|59.195.132.66.censys-scanner.com|7
66.132.195.71|71.195.132.66.censys-scanner.com|7
66.132.195.118|118.195.132.66.censys-scanner.com|7
66.132.224.80|80.224.132.66.censys-scanner.com|7
66.240.192.138|census8.shodan.io|7
71.6.135.131|soda.census.shodan.io|7
79.3.96.178|host-79-3-96-178.business.telecomitalia.it|7
79.72.3.119|-|7
80.82.77.33|sky.census.shodan.io|7
80.94.92.186|-|7
80.253.31.232|-|7
81.192.46.45|adsl-45-46-192-81.adsl.iam.net.ma|7
86.54.31.34|wine.census.shodan.io|7
94.102.49.193|cloud.census.shodan.io|7
95.59.142.69|-|7
95.188.91.101|-|7
95.215.0.145|scan.f6.security|7
101.47.158.137|-|7
102.140.97.134|-|7
103.26.136.173|mail.gshakti.org|7
109.100.14.222|-|7
114.10.47.235|-|7
115.140.161.61|-|7
118.26.111.107|-|7
118.145.245.82|-|7
121.159.71.249|-|7
122.168.194.41|abts-mp-static-041.194.168.122.airtelbroadband.in|7
130.49.189.41|-|7
138.68.243.18|-|7
143.20.49.38|-|7
148.66.132.204|204.132.66.148.host.secureserver.net|7
148.66.142.9|9.142.66.148.host.secureserver.net|7
152.32.174.171|-|7
161.35.108.63|portscanner-nyc1-02.prod.cyberresilience.io|7
167.94.146.50|50.146.94.167.censys-scanner.com|7
167.94.146.52|52.146.94.167.censys-scanner.com|7
167.94.146.54|54.146.94.167.censys-scanner.com|7
167.94.146.55|55.146.94.167.censys-scanner.com|7
167.94.146.56|56.146.94.167.censys-scanner.com|7
167.94.146.58|58.146.94.167.censys-scanner.com|7
167.94.146.61|61.146.94.167.censys-scanner.com|7
167.94.146.62|62.146.94.167.censys-scanner.com|7
171.231.194.224|dynamic-ip-adsl.viettel.vn|7
182.93.50.90|n18293z50l90.static.ctmip.net|7
185.137.122.108|vmi3301316.contaboserver.net|7
185.227.153.56|-|7
187.16.96.250|mvx-187-16-96-250.mundivox.com|7
189.217.130.86|customer-189-217-130-86.cablevision.net.mx|7
192.253.248.169|-|7
193.46.255.86|-|7
196.216.81.126|-|7
197.5.145.102|-|7
199.45.154.139|139.154.45.199.censys-scanner.com|7
199.45.155.71|71.155.45.199.censys-scanner.com|7
199.45.155.87|87.155.45.199.censys-scanner.com|7
199.45.155.89|89.155.45.199.censys-scanner.com|7
201.76.120.30|30.120.76.201.in-addr.arpa.verointernet.com.br|7
203.121.40.210|-|7
213.209.159.158|-|7
217.154.61.249|ip217-154-61-249.pbiaas.com|7
218.106.33.54|-|7
218.145.181.48|-|7
220.80.223.144|-|7
221.160.80.33|-|7
221.161.235.168|-|7
222.107.156.227|-|7
