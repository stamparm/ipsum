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

Wall of Shame (2026-02-01)
----

|IP|DNS lookup|Number of (black)lists|
|---|---|--:|
45.148.10.141|-|9
101.36.104.242|-|9
195.40.154.8|-|9
213.209.159.158|-|9
2.57.122.238|-|8
3.149.59.26|scan.cypex.ai|8
45.148.10.151|-|8
45.148.10.152|-|8
80.82.77.33|sky.census.shodan.io|8
91.224.92.108|srv-91-224-92-108.serveroffer.net|8
92.118.39.72|-|8
93.174.95.106|battery.census.shodan.io|8
103.40.61.98|-|8
134.65.30.157|-|8
162.142.125.209|209.125.142.162.censys-scanner.com|8
162.142.125.210|210.125.142.162.censys-scanner.com|8
176.65.134.22|176.65.134.22|8
177.70.2.220|none.underplatform.com|8
192.142.25.95|hosted-by.host-palace.com|8
216.108.237.50|lasvegas-nv-datacenter.serverpoint.com|8
217.154.38.135|-|8
1.55.33.86|-|7
2.57.121.25|hosting25.tronicsat.com|7
3.143.33.63|scan.cypex.ai|7
14.63.217.28|-|7
34.142.110.144|144.110.142.34.bc.googleusercontent.com|7
35.237.94.18|18.94.237.35.bc.googleusercontent.com|7
36.66.16.233|-|7
37.120.213.13|-|7
45.43.37.254|-|7
45.78.235.71|-|7
45.119.81.249|-|7
45.148.10.121|-|7
45.148.10.147|-|7
45.148.10.157|-|7
45.227.254.170|-|7
47.180.114.229|47-180-114-229.944e76fe48b133ae6f88b784db937d44.ip.frontiernet.net|7
50.84.211.204|syn-050-084-211-204.biz.spectrum.com|7
51.158.120.121|121-120-158-51.instances.scw.cloud|7
58.49.26.202|-|7
61.245.11.87|-|7
64.62.156.192|-|7
64.62.156.222|-|7
64.89.160.47|-|7
66.132.153.120|120.153.132.66.censys-scanner.com|7
66.132.153.131|131.153.132.66.censys-scanner.com|7
66.240.192.138|census8.shodan.io|7
66.248.205.66|-|7
68.167.181.35|68-167-181-35.storageonevps.com|7
68.183.234.194|-|7
77.42.85.51|static.51.85.42.77.clients.your-server.de|7
78.109.200.147|-|7
79.3.96.178|host-79-3-96-178.business.telecomitalia.it|7
79.104.0.82|-|7
80.94.92.184|-|7
80.253.31.232|-|7
82.165.66.87|ip82-165-66-87.pbiaas.com|7
85.111.68.98|85.111.68.98.dynamic.ttnet.com.tr|7
86.54.31.40|blue.census.shodan.io|7
87.103.126.54|54.126.103.87.rev.vodafone.pt|7
89.185.81.112|153823.ip-ptr.tech|7
91.224.92.54|ascrl6.writeresaychooseboltsnow.com|7
91.224.92.78|srv-91-224-92-78.serveroffer.net|7
91.224.92.190|srv-91-224-92-190.serveroffer.net|7
92.27.157.252|host-92-27-157-252.static.as13285.net|7
92.118.39.56|-|7
92.118.39.76|-|7
95.167.225.76|-|7
95.215.0.144|scan.f6.security|7
101.36.107.228|-|7
103.48.192.48|-|7
103.113.105.228|-|7
103.148.118.211|-|7
103.182.132.154|-|7
103.232.121.71|nick8472839|7
103.236.95.173|-|7
103.237.144.204|-|7
103.252.73.37|-|7
117.1.28.49|-|7
118.70.178.158|-|7
121.52.147.5|upesh.edu.pk|7
122.225.203.106|-|7
130.12.180.103|-|7
138.204.127.54|-|7
140.83.84.95|-|7
144.31.249.128|-|7
147.135.76.204|-|7
148.216.255.251|-|7
151.80.61.151|vps-5d95afd4.vps.ovh.net|7
162.142.125.198|198.125.142.162.censys-scanner.com|7
162.142.125.201|201.125.142.162.censys-scanner.com|7
162.142.125.216|216.125.142.162.censys-scanner.com|7
162.142.125.219|219.125.142.162.censys-scanner.com|7
162.142.125.222|222.125.142.162.censys-scanner.com|7
165.90.27.250|-|7
165.154.40.205|-|7
165.154.105.128|-|7
167.94.146.49|49.146.94.167.censys-scanner.com|7
167.99.78.165|108.jobs-dev-database|7
171.220.244.134|-|7
172.104.11.4|jersey.scan.bufferover.run|7
179.33.186.151|-|7
180.76.172.156|-|7
182.43.235.218|-|7
183.82.126.193|183.82.126.193.actcorp.in|7
183.162.79.39|-|7
186.56.11.17|-|7
187.16.96.250|mvx-187-16-96-250.mundivox.com|7
189.8.108.39|39.108.8.189.redel.com.br|7
190.32.246.14|-|7
190.129.122.185|-|7
195.178.110.15|-|7
199.45.155.111|111.155.45.199.censys-scanner.com|7
206.168.34.42|42.34.168.206.censys-scanner.com|7
206.168.34.45|45.34.168.206.censys-scanner.com|7
206.168.34.53|53.34.168.206.censys-scanner.com|7
206.168.34.204|204.34.168.206.censys-scanner.com|7
206.168.34.222|222.34.168.206.censys-scanner.com|7
213.209.159.159|-|7
216.180.246.84|crawler084.deepfield.net|7
216.180.246.250|crawler250.deepfield.net|7
220.247.224.226|-|7
