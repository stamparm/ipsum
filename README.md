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

Wall of Shame (2026-01-18)
----

|IP|DNS lookup|Number of (black)lists|
|---|---|--:|
213.209.159.158|-|10
45.148.10.121|-|9
2.57.121.112|dns112.personaliseplus.com|8
38.248.14.48|-|8
103.232.121.71|nick8472839|8
118.26.111.61|-|8
121.142.146.167|-|8
162.142.125.32|scanner-201.ch1.censys-scanner.com|8
162.142.125.223|scanner-207.ch1.censys-scanner.com|8
213.209.159.159|-|8
216.108.237.50|lasvegas-nv-datacenter.serverpoint.com|8
217.154.38.135|-|8
220.95.14.102|-|8
2.57.121.25|hosting25.tronicsat.com|7
3.143.33.63|scan.cypex.ai|7
14.63.196.175|-|7
14.103.92.40|-|7
23.224.68.178|-|7
35.240.174.82|82.174.240.35.bc.googleusercontent.com|7
36.91.166.34|-|7
37.120.213.13|-|7
38.55.16.34|-|7
45.33.80.243|minsk.scan.bufferover.run|7
45.43.37.254|-|7
45.91.64.6|-|7
61.245.11.87|-|7
66.132.153.118|118.153.132.66.censys-scanner.com|7
66.132.153.119|119.153.132.66.censys-scanner.com|7
66.132.153.130|130.153.132.66.censys-scanner.com|7
66.175.213.4|vilnius.scan.bufferover.run|7
66.240.192.138|census8.shodan.io|7
71.6.135.131|soda.census.shodan.io|7
71.6.165.200|census12.shodan.io|7
77.83.39.128|-|7
80.82.77.139|dojo.census.shodan.io|7
91.202.233.33|-|7
91.224.92.14|srv-91-224-92-14.serveroffer.net|7
93.174.95.106|battery.census.shodan.io|7
95.214.55.246|continued.zonogicism.nl|7
101.36.104.242|-|7
101.36.107.228|-|7
101.36.114.252|fwnvyxu.top|7
103.211.59.6|-|7
115.231.78.11|-|7
118.69.199.170|-|7
121.179.93.147|-|7
122.155.0.205|host1.bgs.co.th|7
134.65.30.157|-|7
137.184.23.103|-|7
139.59.64.179|-|7
154.198.50.104|-|7
161.49.89.39|161.49.89.39.convergeict.com|7
162.142.125.40|scanner-201.ch1.censys-scanner.com|7
162.142.125.113|-|7
162.142.125.116|-|7
162.142.125.127|-|7
162.142.125.203|scanner-202.ch1.censys-scanner.com|7
162.216.150.251|251.150.216.162.bc.googleusercontent.com|7
167.94.138.167|-|7
167.94.146.48|-|7
167.94.146.50|-|7
167.94.146.53|-|7
167.94.146.54|-|7
167.94.146.57|-|7
171.104.143.176|-|7
175.200.104.40|-|7
176.65.132.210|-|7
176.65.148.45|176.65.148.45.ptr.pfcloud.network|7
181.116.220.140|-|7
182.76.204.237|nsg-static-237.204.76.182-airtel.com|7
185.196.10.2|root|7
195.3.222.78|-|7
195.40.154.8|-|7
196.188.168.148|-|7
198.98.53.110|-|7
200.69.236.207|seldon.tecnologica.com.ar|7
200.73.135.75|75.135.73.200.cab.prima.net.ar|7
200.109.234.38|200.109.234-38.cnt-02.rai.cantv.net|7
206.189.82.12|-|7
220.80.223.144|-|7
