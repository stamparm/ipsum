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

Wall of Shame (2026-05-04)
----

|IP|DNS lookup|Number of (black)lists|
|---|---|--:|
45.205.1.8|-|9
190.2.135.111|190-2-135-111.hosted-by-worldstream.net|9
5.253.59.171|189809.ip-ptr.tech|8
43.135.124.152|-|8
71.6.135.131|soda.census.shodan.io|8
80.82.77.33|sky.census.shodan.io|8
80.82.77.139|dojo.census.shodan.io|8
87.251.64.149|-|8
93.174.95.106|battery.census.shodan.io|8
163.7.1.156|-|8
213.209.159.56|-|8
213.209.159.158|-|8
216.57.110.81|-|8
2.57.121.25|hosting25.tronicsat.com|7
2.57.122.194|-|7
2.57.122.238|-|7
14.63.217.28|-|7
45.148.10.121|-|7
45.148.10.151|-|7
45.148.10.157|-|7
45.148.10.183|-|7
66.132.224.80|80.224.132.66.censys-scanner.com|7
66.132.224.83|83.224.132.66.censys-scanner.com|7
66.132.224.84|84.224.132.66.censys-scanner.com|7
71.6.165.200|census12.shodan.io|7
85.217.149.66|o066.scanner.modat.io|7
86.54.31.32|hat.census.shodan.io|7
86.54.31.34|wine.census.shodan.io|7
87.251.64.147|-|7
89.44.137.152|-|7
89.190.156.34|smtp-3.goinbox.in|7
94.26.106.206|-|7
103.210.22.17|-|7
120.241.79.66|-|7
125.20.210.182|-|7
129.159.149.21|-|7
163.7.9.84|-|7
167.94.146.63|63.146.94.167.censys-scanner.com|7
185.38.148.2|2.148.38.185.baremetal.zare.com|7
192.42.116.16|tor-exit.hartvoorinternetvrijheid.nl|7
192.42.116.19|this-is-a-tor-exit-node-hviv119.hviv.nl|7
193.24.211.95|-|7
199.45.154.155|155.154.45.199.censys-scanner.com|7
199.45.155.96|96.155.45.199.censys-scanner.com|7
