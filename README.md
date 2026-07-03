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

Wall of Shame (2026-07-03)
----

|IP|DNS lookup|Number of (black)lists|
|---|---|--:|
125.20.210.182|-|10
176.53.159.197|-|10
176.53.159.198|-|10
80.82.77.139|dojo.census.shodan.io|9
185.65.202.199|-|9
185.242.3.195|-|9
193.46.255.86|-|9
2.57.122.209|-|8
34.178.21.247|247.21.178.34.bc.googleusercontent.com|8
45.148.10.121|-|8
66.132.195.84|84.195.132.66.censys-scanner.com|8
66.132.224.228|228.224.132.66.censys-scanner.com|8
71.6.135.131|soda.census.shodan.io|8
79.76.58.113|-|8
92.118.39.71|-|8
93.89.113.60|93.89.113.60.ip.vitnett.no|8
116.99.49.208|dynamic-ip-adsl.viettel.vn|8
118.26.111.107|-|8
158.101.161.27|-|8
167.94.146.51|51.146.94.167.censys-scanner.com|8
167.94.146.60|60.146.94.167.censys-scanner.com|8
195.178.110.228|-|8
220.80.223.144|-|8
2.57.121.25|hosting25.tronicsat.com|7
2.57.122.150|-|7
14.103.10.167|-|7
18.116.101.220|scan.visionheight.com|7
31.132.90.3|-|7
34.175.118.185|185.118.175.34.bc.googleusercontent.com|7
35.205.111.42|42.111.205.35.bc.googleusercontent.com|7
38.191.248.41|-|7
45.148.10.141|-|7
45.148.10.152|-|7
45.148.10.157|-|7
45.148.10.200|-|7
45.153.34.158|-|7
47.252.46.218|-|7
51.68.226.87|vps-fc0b2823.vps.ovh.net|7
62.60.130.219|-|7
66.132.172.138|138.172.132.66.censys-scanner.com|7
66.132.186.181|181.186.132.66.censys-scanner.com|7
66.132.195.47|47.195.132.66.censys-scanner.com|7
66.132.195.49|49.195.132.66.censys-scanner.com|7
66.132.195.69|69.195.132.66.censys-scanner.com|7
66.132.195.76|76.195.132.66.censys-scanner.com|7
66.132.224.83|83.224.132.66.censys-scanner.com|7
71.6.167.142|census9.shodan.io|7
80.94.92.55|-|7
80.225.238.77|-|7
81.28.167.30|-|7
85.217.140.51|o350.scanner.modat.io|7
86.54.31.38|blue2.census.shodan.io|7
96.78.175.41|-|7
101.36.124.127|mail6.bahia-paradise.com|7
101.47.15.119|-|7
102.140.97.134|-|7
103.48.192.48|-|7
103.143.231.24|-|7
103.182.132.154|-|7
107.155.48.46|-|7
110.35.80.116|IP-80-116.napinfo.net|7
112.167.99.220|-|7
116.228.233.93|-|7
117.175.51.134|-|7
117.175.140.121|-|7
122.168.194.41|abts-mp-static-041.194.168.122.airtelbroadband.in|7
139.99.74.35|-|7
148.66.142.9|9.142.66.148.host.secureserver.net|7
149.118.135.252|-|7
157.66.26.151|-|7
160.174.129.232|-|7
160.187.174.22|-|7
161.82.146.86|-|7
161.132.54.218|-|7
164.92.161.148|-|7
167.94.146.50|50.146.94.167.censys-scanner.com|7
167.94.146.53|53.146.94.167.censys-scanner.com|7
167.94.146.55|55.146.94.167.censys-scanner.com|7
167.94.146.58|58.146.94.167.censys-scanner.com|7
167.94.146.61|61.146.94.167.censys-scanner.com|7
167.94.146.62|62.146.94.167.censys-scanner.com|7
167.94.146.63|63.146.94.167.censys-scanner.com|7
168.144.95.137|-|7
171.220.244.134|-|7
171.244.37.103|-|7
178.185.136.57|-|7
180.76.172.156|-|7
180.100.217.164|-|7
185.162.141.34|-|7
185.177.72.66|-|7
185.180.141.42|zl-dala-us-gp1-wk124a.internet-census.org|7
186.96.151.198|fixed-186-96-151-198.totalplay.net|7
189.217.130.86|customer-189-217-130-86.cablevision.net.mx|7
189.244.111.61|acceso-189.244.111.61.prod-infinitum.com.mx|7
190.167.237.191|191.237.167.190.l.static.claro.net.do|7
193.202.11.112|-|7
195.178.110.232|-|7
197.5.145.102|-|7
199.45.154.113|113.154.45.199.censys-scanner.com|7
199.45.155.104|104.155.45.199.censys-scanner.com|7
209.99.191.19|-|7
212.127.90.201|-|7
218.145.181.48|-|7
222.107.156.227|-|7
