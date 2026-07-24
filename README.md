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

Wall of Shame (2026-07-24)
----

|IP|DNS lookup|Number of (black)lists|
|---|---|--:|
195.178.110.137|-|11
77.90.185.20|-|10
93.174.95.106|battery.census.shodan.io|9
167.94.146.61|61.146.94.167.censys-scanner.com|9
167.94.146.63|63.146.94.167.censys-scanner.com|9
45.148.10.157|-|8
94.154.43.50|-|8
118.216.88.229|-|8
158.51.96.38|unknown.ip-xfer.net|8
167.94.146.56|56.146.94.167.censys-scanner.com|8
167.94.146.57|57.146.94.167.censys-scanner.com|8
176.53.159.198|-|8
185.242.3.195|-|8
192.142.28.77|hosted-by.host-palace.com|8
195.178.110.232|-|8
220.116.26.179|-|8
2.57.121.25|hosting25.tronicsat.com|7
2.57.121.112|dns112.personaliseplus.com|7
3.130.168.2|scan.visionheight.com|7
16.58.56.214|scan.visionheight.com|7
27.155.92.28|-|7
41.63.63.211|-|7
43.153.206.227|-|7
45.148.10.147|-|7
45.148.10.151|-|7
45.148.10.152|-|7
45.148.10.240|-|7
45.156.87.165|-|7
45.156.87.182|-|7
45.198.224.5|-|7
45.227.254.170|-|7
46.8.245.94|-|7
61.19.69.203|-|7
62.60.130.219|-|7
62.133.60.31|39628.ip-ptr.tech|7
64.226.126.224|-|7
65.49.139.223|65.49.139.223.nwinternet.com|7
66.132.172.130|130.172.132.66.censys-scanner.com|7
66.132.172.140|140.172.132.66.censys-scanner.com|7
66.132.172.182|182.172.132.66.censys-scanner.com|7
66.132.172.200|200.172.132.66.censys-scanner.com|7
66.132.172.208|208.172.132.66.censys-scanner.com|7
66.132.186.176|176.186.132.66.censys-scanner.com|7
66.132.195.53|53.195.132.66.censys-scanner.com|7
66.132.195.54|54.195.132.66.censys-scanner.com|7
66.132.195.64|64.195.132.66.censys-scanner.com|7
66.132.195.77|77.195.132.66.censys-scanner.com|7
66.132.195.85|85.195.132.66.censys-scanner.com|7
66.132.195.87|87.195.132.66.censys-scanner.com|7
66.132.195.104|104.195.132.66.censys-scanner.com|7
66.132.224.79|79.224.132.66.censys-scanner.com|7
66.132.224.83|83.224.132.66.censys-scanner.com|7
66.132.224.90|90.224.132.66.censys-scanner.com|7
66.132.224.224|224.224.132.66.censys-scanner.com|7
66.132.224.229|229.224.132.66.censys-scanner.com|7
66.132.224.232|232.224.132.66.censys-scanner.com|7
66.132.224.233|233.224.132.66.censys-scanner.com|7
68.183.105.175|portscanner-nyc1-01.prod.cyberresilience.io|7
71.6.165.200|census12.shodan.io|7
80.82.77.33|sky.census.shodan.io|7
80.94.92.234|-|7
81.30.98.144|-|7
85.217.149.60|o060.scanner.modat.io|7
89.126.211.166|-|7
91.92.47.117|-|7
92.118.39.14|-|7
92.154.95.236|lstlambert-656-1-48-236.w92-154.abo.wanadoo.fr|7
94.102.49.193|cloud.census.shodan.io|7
94.154.43.230|-|7
103.148.100.146|-|7
118.26.111.107|-|7
118.145.104.37|-|7
128.14.232.142|-|7
148.66.142.9|9.142.66.148.host.secureserver.net|7
152.42.164.200|-|7
156.225.1.42|-|7
162.216.150.76|76.150.216.162.bc.googleusercontent.com|7
167.94.146.49|49.146.94.167.censys-scanner.com|7
167.94.146.53|53.146.94.167.censys-scanner.com|7
167.94.146.58|58.146.94.167.censys-scanner.com|7
167.94.146.59|59.146.94.167.censys-scanner.com|7
167.94.146.60|60.146.94.167.censys-scanner.com|7
185.65.202.199|-|7
185.190.142.132|vmi3385248.contaboserver.net|7
193.24.211.76|-|7
193.32.162.84|-|7
193.46.255.86|-|7
199.45.155.66|66.155.45.199.censys-scanner.com|7
199.45.155.76|76.155.45.199.censys-scanner.com|7
220.80.223.144|-|7
223.123.92.132|-|7
