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

Wall of Shame (2026-08-08)
----

|IP|DNS lookup|Number of (black)lists|
|---|---|--:|
77.90.185.20|-|10
43.153.206.227|-|9
144.225.6.182|-|9
195.178.110.137|-|9
31.77.227.120|-|8
45.148.10.141|-|8
45.154.244.193|-|8
45.198.224.26|-|8
79.72.57.232|-|8
80.82.77.139|dojo.census.shodan.io|8
92.5.66.49|-|8
94.183.177.21|-|8
118.26.111.107|-|8
164.92.109.155|-|8
195.93.244.97|ib.systems|8
1.255.171.167|-|7
2.57.121.25|hosting25.tronicsat.com|7
2.57.121.112|dns112.personaliseplus.com|7
2.57.122.53|-|7
2.57.122.168|-|7
2.57.122.238|-|7
35.241.181.19|19.181.241.35.bc.googleusercontent.com|7
45.63.4.69|45.63.4.69.vultrusercontent.com|7
45.148.10.147|-|7
45.148.10.151|-|7
45.148.10.152|-|7
45.148.10.157|-|7
54.237.223.62|ec2-54-237-223-62.compute-1.amazonaws.com|7
64.62.197.152|-|7
64.62.197.227|-|7
65.49.139.223|65.49.139.223.nwinternet.com|7
66.132.172.45|45.172.132.66.censys-scanner.com|7
66.132.172.204|204.172.132.66.censys-scanner.com|7
66.132.195.49|49.195.132.66.censys-scanner.com|7
66.132.195.52|52.195.132.66.censys-scanner.com|7
66.132.195.62|62.195.132.66.censys-scanner.com|7
66.132.195.71|71.195.132.66.censys-scanner.com|7
66.132.195.109|109.195.132.66.censys-scanner.com|7
66.132.195.111|111.195.132.66.censys-scanner.com|7
66.132.195.118|118.195.132.66.censys-scanner.com|7
66.132.195.119|119.195.132.66.censys-scanner.com|7
66.132.224.223|223.224.132.66.censys-scanner.com|7
66.132.224.237|237.224.132.66.censys-scanner.com|7
71.6.165.200|census12.shodan.io|7
80.94.92.179|-|7
80.94.92.234|-|7
83.97.78.224|-|7
89.126.211.166|-|7
92.118.39.49|-|7
92.118.39.50|-|7
92.118.39.77|-|7
95.215.0.144|scan.f6.security|7
103.85.85.175|-|7
115.21.125.227|-|7
116.99.49.208|dynamic-adsl.viettel.vn|7
147.185.132.144|-|7
148.66.142.9|9.142.66.148.host.secureserver.net|7
158.51.96.38|unknown.ip-xfer.net|7
167.94.146.55|55.146.94.167.censys-scanner.com|7
167.94.146.60|60.146.94.167.censys-scanner.com|7
167.94.146.61|61.146.94.167.censys-scanner.com|7
167.94.146.62|62.146.94.167.censys-scanner.com|7
168.144.120.7|-|7
168.144.242.95|-|7
176.32.193.16|-|7
185.190.25.168|-|7
192.42.116.12|hviv-bare.as1101.net|7
193.46.255.86|-|7
195.178.110.227|-|7
199.45.155.72|72.155.45.199.censys-scanner.com|7
207.57.124.34|-|7
220.80.223.144|-|7
