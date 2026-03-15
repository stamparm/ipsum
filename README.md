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

Wall of Shame (2026-03-15)
----

|IP|DNS lookup|Number of (black)lists|
|---|---|--:|
2.57.121.25|hosting25.tronicsat.com|9
2.57.121.112|dns112.personaliseplus.com|9
162.142.125.125|125.125.142.162.censys-scanner.com|9
162.142.125.192|192.125.142.162.censys-scanner.com|9
167.94.146.53|53.146.94.167.censys-scanner.com|9
3.143.162.210|scan.visionheight.com|8
14.63.217.28|-|8
66.132.153.125|125.153.132.66.censys-scanner.com|8
66.240.192.138|census8.shodan.io|8
71.6.199.23|einstein.census.shodan.io|8
80.82.77.33|sky.census.shodan.io|8
80.82.77.139|dojo.census.shodan.io|8
80.94.95.115|-|8
80.94.95.116|-|8
93.123.109.176|-|8
93.174.95.106|battery.census.shodan.io|8
94.26.106.200|-|8
101.36.118.177|-|8
107.150.119.229|-|8
130.12.182.185|-|8
163.43.147.180|-|8
167.94.146.52|52.146.94.167.censys-scanner.com|8
167.94.146.63|63.146.94.167.censys-scanner.com|8
185.91.69.217|-|8
185.156.73.233|-|8
198.12.67.159|-|8
206.168.34.196|196.34.168.206.censys-scanner.com|8
213.209.159.159|-|8
2.57.122.238|-|7
3.131.220.121|scan.visionheight.com|7
14.63.196.175|-|7
36.64.68.99|-|7
36.255.3.203|-|7
40.160.34.88|ns1001853.ip-40-160-34.us|7
42.116.108.125|-|7
43.252.231.122|-|7
45.15.224.178|-|7
45.66.228.255|iceberg.30x.ru|7
45.148.10.121|-|7
45.148.10.192|-|7
45.156.129.161|sh-chi-us-gp6-wk126b.internet-census.org|7
45.175.37.18|-|7
45.232.73.84|-|7
45.249.245.88|-|7
47.180.114.229|47-180-114-229.944e76fe48b133ae6f88b784db937d44.ip.frontiernet.net|7
50.84.211.204|syn-050-084-211-204.biz.spectrum.com|7
51.158.120.121|121-120-158-51.instances.scw.cloud|7
58.222.244.226|-|7
59.12.160.91|-|7
61.240.156.16|-|7
61.245.11.87|-|7
62.178.191.71|62-178-191-71.cable.dynamic.surfer.at|7
66.132.153.118|118.153.132.66.censys-scanner.com|7
66.132.153.120|120.153.132.66.censys-scanner.com|7
66.132.153.122|122.153.132.66.censys-scanner.com|7
66.132.153.128|128.153.132.66.censys-scanner.com|7
66.132.153.131|131.153.132.66.censys-scanner.com|7
66.132.153.137|137.153.132.66.censys-scanner.com|7
66.132.153.139|139.153.132.66.censys-scanner.com|7
66.132.153.142|142.153.132.66.censys-scanner.com|7
71.6.134.233|centos7134233.aspadmin.net|7
71.6.135.131|soda.census.shodan.io|7
71.6.158.166|ninja.census.shodan.io|7
79.3.96.178|host-79-3-96-178.business.telecomitalia.it|7
80.82.70.133|rnd.group-ib.com|7
80.94.92.168|-|7
80.94.92.171|-|7
80.94.92.182|-|7
80.94.92.184|-|7
81.211.72.167|-|7
82.24.64.32|-|7
82.165.66.87|ip82-165-66-87.pbiaas.com|7
85.18.236.229|85-18-236-229.ip.fastwebnet.it|7
85.217.149.25|o026.scanner.modat.io|7
87.106.91.226|-|7
89.248.167.131|mason.census.shodan.io|7
91.224.92.50|imize2.writeresaychooseboltsnow.com|7
92.27.101.99|host-92-27-101-99.static.as13285.net|7
92.118.39.56|-|7
92.118.39.72|-|7
94.26.106.201|-|7
95.167.225.76|-|7
101.36.104.242|-|7
101.47.158.137|-|7
101.126.54.66|-|7
103.182.132.154|-|7
109.105.210.72|zl-dfwc-us-gp1-wk110a.internet-census.org|7
113.56.161.85|-|7
114.111.54.188|-|7
118.70.178.158|-|7
119.96.173.169|-|7
121.165.84.80|-|7
121.165.204.105|-|7
125.17.108.32|server.serverinfo.in.net|7
125.21.59.218|-|7
130.12.181.157|-|7
134.65.30.157|-|7
138.124.67.78|-|7
147.45.50.108|143005.ip-ptr.tech|7
152.32.162.42|-|7
152.228.131.33|vps-a34f1667.vps.ovh.net|7
154.221.27.234|-|7
157.66.26.151|-|7
161.49.89.39|161.49.89.39.convergeict.com|7
162.142.125.42|42.125.142.162.censys-scanner.com|7
162.142.125.46|46.125.142.162.censys-scanner.com|7
162.142.125.114|114.125.142.162.censys-scanner.com|7
162.142.125.116|116.125.142.162.censys-scanner.com|7
162.142.125.117|117.125.142.162.censys-scanner.com|7
162.142.125.195|195.125.142.162.censys-scanner.com|7
162.142.125.198|198.125.142.162.censys-scanner.com|7
162.142.125.200|200.125.142.162.censys-scanner.com|7
162.142.125.205|205.125.142.162.censys-scanner.com|7
162.142.125.208|208.125.142.162.censys-scanner.com|7
162.142.125.211|211.125.142.162.censys-scanner.com|7
162.142.125.215|215.125.142.162.censys-scanner.com|7
162.142.125.219|219.125.142.162.censys-scanner.com|7
163.7.1.156|-|7
167.94.138.35|35.138.94.167.censys-scanner.com|7
167.94.146.48|48.146.94.167.censys-scanner.com|7
167.94.146.49|49.146.94.167.censys-scanner.com|7
167.94.146.55|55.146.94.167.censys-scanner.com|7
167.94.146.58|58.146.94.167.censys-scanner.com|7
167.94.146.62|62.146.94.167.censys-scanner.com|7
171.104.143.176|-|7
176.32.195.85|scan.f6.security|7
176.65.134.22|176.65.134.22|7
176.120.22.13|-|7
176.120.22.17|-|7
177.229.197.38|customer-MCA-TGZ-197-38.megared.net.mx|7
182.93.50.90|n18293z50l90.static.ctmip.net|7
185.177.72.52|-|7
185.211.94.76|185-211-94-76.static.xelon.ch|7
185.242.3.105|-|7
187.16.96.250|mvx-187-16-96-250.mundivox.com|7
187.210.77.100|customer-187-210-77-100.uninet-ide.com.mx|7
189.217.130.86|customer-189-217-130-86.cablevision.net.mx|7
190.129.122.185|-|7
193.46.255.86|hostingmailto239.statics.servermail.org|7
197.5.145.8|-|7
197.5.145.73|-|7
197.153.57.103|-|7
197.227.8.186|-|7
198.44.177.67|-|7
199.45.155.78|78.155.45.199.censys-scanner.com|7
200.196.50.91|mvx-200-196-50-91.mundivox.com|7
203.121.40.210|-|7
203.150.107.244|244.107.150.203.sta.inet.co.th|7
206.168.34.33|33.34.168.206.censys-scanner.com|7
206.168.34.39|39.34.168.206.censys-scanner.com|7
206.168.34.60|60.34.168.206.censys-scanner.com|7
206.168.34.61|61.34.168.206.censys-scanner.com|7
206.168.34.117|117.34.168.206.censys-scanner.com|7
211.20.14.156|211-20-14-156.hinet-ip.hinet.net|7
213.67.210.12|213-67-210-12-no2664.tbcn.telia.com|7
217.154.69.208|-|7
218.145.181.48|-|7
218.157.205.238|-|7
219.150.93.157|-|7
220.80.223.144|-|7
220.247.223.56|56.sta.idc-2.slt.lk|7
221.156.126.1|-|7
221.159.150.85|-|7
221.161.235.168|-|7
221.229.218.50|-|7
222.104.120.107|-|7
222.107.156.227|-|7
223.197.186.7|223-197-186-7.static.imsbiz.com|7
