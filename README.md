![Logo](https://i.imgur.com/PyKLAe7.png)

[![License](https://img.shields.io/badge/license-The_Unlicense-red.svg)](https://unlicense.org/)

About
----

**IPsum** is a threat intelligence feed based on 30+ different publicly available [lists](https://github.com/stamparm/maltrail) of suspicious and/or malicious IP addresses. All lists are automatically retrieved and parsed on a daily (24h) basis and the final result is pushed to this repository. List is made of IP addresses together with a total number of (black)list occurrence (for each). Greater the number, lesser the chance of false positive detection and/or dropping in (inbound) monitored traffic. Also, list is sorted from most (problematic) to least occurent IP addresses.

As an example, to get a fresh and ready-to-deploy auto-ban list of "bad IPs" that appear on at least 3 (black)lists you can run:

```
curl https://raw.githubusercontent.com/stamparm/ipsum/master/ipsum.txt 2>/dev/null | grep -v "#" | grep -v -E "\s[1-2]$" | cut -f 1
```

If you want to try it with `ipset`, you can do the following:

```
sudo su
apt-get -qq install iptables ipset
ipset -q flush ipsum
ipset -q create ipsum hash:ip
for ip in $(curl https://raw.githubusercontent.com/stamparm/ipsum/master/ipsum.txt 2>/dev/null | grep -v "#" | grep -v -E "\s[1-2]$" | cut -f 1); do ipset add ipsum $ip; done
iptables -D INPUT -m set --match-set ipsum src -j DROP 2>/dev/null
iptables -I INPUT -m set --match-set ipsum src -j DROP
```

In directory [levels](levels) you can find preprocessed raw IP lists based on number of blacklist occurrences (e.g. [levels/3.txt](levels/3.txt) holds IP addresses that can be found on 3 or more blacklists).

Wall of Shame (2025-11-23)
----

|IP|DNS lookup|Number of (black)lists|
|---|---|--:|
2.57.121.112|dns112.personaliseplus.com|10
123.253.22.30|-|9
27.79.2.227|localhost|8
62.60.131.157|-|8
66.132.153.114|-|8
66.132.153.142|scanner-001.ch1.censys-scanner.com|8
80.82.77.33|sky.census.shodan.io|8
80.94.92.182|-|8
93.174.95.106|battery.census.shodan.io|8
144.126.224.102|-|8
162.142.125.114|-|8
162.142.125.120|-|8
162.142.125.126|-|8
185.156.73.233|-|8
190.72.106.126|190-72-106-126.scr-00.rai.borde.cantv.net|8
193.32.162.146|-|8
193.32.162.157|-|8
220.80.223.144|-|8
3.130.96.91|scan.cypex.ai|7
3.131.215.38|ec2-3-131-215-38.us-east-2.compute.amazonaws.com|7
3.132.23.201|scan.cypex.ai|7
3.134.148.59|scan.cypex.ai|7
3.137.73.221|scan.cypex.ai|7
3.143.33.63|scan.cypex.ai|7
5.187.97.40|-|7
14.29.240.154|-|7
14.63.196.175|-|7
14.63.217.28|-|7
14.139.216.56|-|7
27.111.32.174|-|7
27.254.137.144|-|7
36.66.16.233|-|7
36.91.166.34|-|7
45.121.147.47|-|7
45.172.152.74|-|7
61.80.179.118|-|7
61.245.11.87|-|7
64.62.197.227|-|7
64.227.174.243|-|7
66.132.153.112|-|7
66.240.236.119|census6.shodan.io|7
71.6.158.166|ninja.census.shodan.io|7
78.186.133.164|78.186.133.164.static.ttnet.com.tr|7
80.82.77.139|dojo.census.shodan.io|7
80.94.92.164|-|7
80.94.92.166|-|7
80.94.92.184|-|7
80.94.92.186|-|7
80.94.93.119|-|7
80.94.93.233|-|7
80.94.95.115|-|7
80.94.95.116|-|7
81.19.141.31|115371.ip-ptr.tech|7
87.103.126.54|54.126.103.87.rev.vodafone.pt|7
89.97.218.142|89-97-218-142.ip19.fastwebnet.it|7
89.248.167.131|mason.census.shodan.io|7
92.118.39.95|-|7
94.102.49.193|cloud.census.shodan.io|7
94.254.0.234|h-94-254-0-234.na.cust.bahnhof.se|7
95.167.225.76|-|7
98.21.17.225|h225.17.21.98.static.ip.windstream.net|7
101.36.107.228|-|7
101.36.108.167|-|7
103.163.219.195|-|7
103.171.85.118|ip103-171-85-118.cloudhost.web.id|7
103.176.78.193|-|7
104.198.43.206|206.43.198.104.bc.googleusercontent.com|7
112.196.70.142|-|7
113.137.40.250|-|7
113.193.234.210|-|7
117.250.96.66|static.ill.117.250.96.66.bsnl.co.in|7
119.96.173.169|-|7
122.114.69.235|-|7
122.155.0.205|host1.bgs.co.th|7
122.168.194.41|abts-mp-static-041.194.168.122.airtelbroadband.in|7
128.14.236.41|-|7
137.184.202.107|nauru.production|7
139.59.64.179|-|7
139.59.188.13|-|7
141.255.164.26|hosted-by.superbit.host|7
147.182.194.60|-|7
150.241.115.127|-|7
152.32.250.188|-|7
156.239.52.88|-|7
160.174.129.232|-|7
161.118.206.188|-|7
162.142.125.112|-|7
162.142.125.113|-|7
162.142.125.117|-|7
162.142.125.123|-|7
162.142.125.125|-|7
162.142.125.127|-|7
162.142.125.195|scanner-202.ch1.censys-scanner.com|7
162.142.125.210|scanner-207.ch1.censys-scanner.com|7
162.142.125.218|scanner-207.ch1.censys-scanner.com|7
163.5.148.15|-|7
164.177.31.66|static-csq-cds-031066.business.bouyguestelecom.com|7
165.154.233.77|-|7
167.94.138.170|-|7
167.94.138.185|-|7
167.94.146.50|-|7
167.94.146.60|-|7
167.99.78.165|108.jobs-dev-database|7
168.167.228.74|-|7
171.104.143.176|-|7
176.32.195.85|scan.f6.security|7
176.235.182.73|-|7
177.229.197.38|customer-MCA-TGZ-197-38.megared.net.mx|7
181.49.50.6|-|7
181.212.81.228|181-212-81-228.baf.movistar.cl|7
185.196.10.175|-|7
185.242.247.154|-|7
189.126.4.42|42-189-126-4.gabandalarga.com.br|7
189.217.130.86|customer-189-217-130-86.cablevision.net.mx|7
190.124.153.17|customer-ftth-sl-190-124-153-17.megacable.com.ar|7
192.210.160.141|192-210-160-141-host.colocrossing.com|7
193.46.255.99|hostingmailto251.statics.servermail.org|7
193.46.255.244|hostingmailto161.statics.servermail.org|7
196.251.100.74|-|7
197.5.145.73|-|7
200.69.236.207|seldon.tecnologica.com.ar|7
200.109.234.38|200.109.234-38.cnt-02.rai.cantv.net|7
202.157.177.33|mail.simaster-brebeskab.id|7
202.165.29.219|-|7
203.145.34.222|-|7
213.55.85.202|-|7
220.247.223.56|56.sta.idc-2.slt.lk|7
