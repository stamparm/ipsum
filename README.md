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

Wall of Shame (2026-08-22)
----

|IP|DNS lookup|Number of (black)lists|
|---|---|--:|
77.90.185.20|-|10
77.239.124.102|-|10
77.239.124.108|-|10
2.57.122.53|-|9
45.154.244.193|-|9
62.60.130.201|-|9
80.82.77.33|sky.census.shodan.io|9
193.47.62.69|-|9
195.178.110.218|-|9
2.57.122.238|-|8
16.5.0.132|embnex.com|8
45.148.10.240|-|8
45.198.224.26|-|8
62.60.130.242|-|8
62.60.130.253|-|8
71.6.135.131|soda.census.shodan.io|8
85.239.149.72|-|8
92.118.39.49|-|8
93.174.95.106|battery.census.shodan.io|8
164.92.109.155|-|8
167.94.146.55|55.146.94.167.censys-scanner.com|8
167.94.146.57|57.146.94.167.censys-scanner.com|8
195.178.110.137|-|8
2.57.122.209|-|7
3.130.168.2|scan.visionheight.com|7
16.5.0.130|embnex.com|7
16.5.0.133|embnex.com|7
18.218.118.203|scan.visionheight.com|7
45.91.64.7|scan.f6.security|7
45.148.10.141|-|7
45.148.10.152|-|7
45.148.10.157|-|7
51.75.170.40|ns1.esphosting.co.uk|7
61.73.27.69|-|7
66.132.172.133|133.172.132.66.censys-scanner.com|7
66.132.172.187|187.172.132.66.censys-scanner.com|7
66.132.172.196|196.172.132.66.censys-scanner.com|7
66.132.195.49|49.195.132.66.censys-scanner.com|7
66.132.195.85|85.195.132.66.censys-scanner.com|7
66.132.224.88|88.224.132.66.censys-scanner.com|7
66.132.224.234|234.224.132.66.censys-scanner.com|7
66.154.115.247|-|7
69.5.7.63|-|7
71.6.199.23|einstein.census.shodan.io|7
80.82.77.139|dojo.census.shodan.io|7
80.94.92.55|-|7
80.94.92.179|-|7
81.181.129.252|-|7
88.151.33.203|-|7
92.118.39.50|-|7
101.51.157.107|node-v3f.pool-101-51.dynamic.nt-isp.net|7
110.173.190.221|-|7
113.20.8.90|mail.ehsqmantis.com|7
144.202.92.17|144.202.92.17.vultrusercontent.com|7
154.16.115.34|server2.atarim.com|7
156.239.238.244|-|7
161.118.212.147|-|7
162.241.235.82|162-241-235-82.unifiedlayer.com|7
167.94.146.54|54.146.94.167.censys-scanner.com|7
167.94.146.58|58.146.94.167.censys-scanner.com|7
167.94.146.62|62.146.94.167.censys-scanner.com|7
172.110.223.149|-|7
192.42.116.17|this-is-a-tor-exit-node-hviv117.hviv.nl|7
193.24.211.204|-|7
195.178.110.217|-|7
195.178.110.227|-|7
197.153.57.103|-|7
213.5.130.217|-|7
220.86.129.106|-|7
220.247.224.226|-|7
