![Logo](https://i.imgur.com/PyKLAe7.png)

[![License](https://img.shields.io/badge/license-The_Unlicense-red.svg)](https://unlicense.org/)

About
----

**IPsum** is a threat intelligence feed based on 30+ different publicly available [lists](https://github.com/stamparm/maltrail) of suspicious and/or malicious IP addresses. All lists are automatically retrieved and parsed on a daily (24h) basis and the final result is pushed to this repository. List is made of IP addresses together with a total number of (black)list occurrence (for each). Greater the number, lesser the chance of false positive detection and/or dropping in (inbound) monitored traffic. Also, list is sorted from most (problematic) to least occurent IP addresses.

As an example, to get a fresh and ready-to-deploy auto-ban list of "bad IPs" that appear on at least 3 (black)lists you can run:

```
curl --compressed https://raw.githubusercontent.com/stamparm/ipsum/master/ipsum.txt 2>/dev/null | grep -v "#" | grep -v -E "\s[1-2]$" | cut -f 1
```

If you want to try it with `ipset`, you can do the following:

```
sudo su
apt-get -qq install iptables ipset
ipset -q flush ipsum
ipset -q create ipsum hash:ip
for ip in $(curl --compressed https://raw.githubusercontent.com/stamparm/ipsum/master/ipsum.txt 2>/dev/null | grep -v "#" | grep -v -E "\s[1-2]$" | cut -f 1); do ipset add ipsum $ip; done
iptables -D INPUT -m set --match-set ipsum src -j DROP 2>/dev/null
iptables -I INPUT -m set --match-set ipsum src -j DROP
```

In directory [levels](levels) you can find preprocessed raw IP lists based on number of blacklist occurrences (e.g. [levels/3.txt](levels/3.txt) holds IP addresses that can be found on 3 or more blacklists).

Wall of Shame (2024-10-10)
----

|IP|DNS lookup|Number of (black)lists|
|---|---|--:|
109.120.176.11|AKoryakin.aeza.network|11
128.199.225.7|-|10
154.213.184.15|-|10
194.169.175.37|-|10
42.228.19.165|hn.kd.ny.adsl|9
80.64.30.138|-|9
80.64.30.139|-|9
107.172.50.166|107-172-50-166-host.colocrossing.com|9
144.22.192.181|-|9
146.190.102.143|-|9
159.65.147.193|panel.mydigitalads.in|9
176.124.207.132|-|9
188.34.205.173|static.173.205.34.188.clients.your-server.de|9
192.42.116.217|20.tor-exit.nothingtohide.nl|9
194.169.175.38|-|9
8.220.201.94|-|8
45.84.89.2|server-0-2.survey.inspici.com|8
45.84.89.3|server-0-3.survey.inspici.com|8
51.222.115.81|ip81.ip-51-222-115.net|8
60.191.23.20|-|8
80.242.208.68|-|8
81.28.167.30|-|8
85.209.11.254|-|8
89.97.218.142|89-97-218-142.ip19.fastwebnet.it|8
91.92.120.31|-|8
93.113.63.8|-|8
101.126.5.109|-|8
103.46.186.148|-|8
106.12.222.76|-|8
113.61.221.29|113-61-221-29.veetime.com|8
154.213.187.14|-|8
178.20.55.16|marcuse.nos-oignons.net|8
178.20.55.182|marcuse-2.nos-oignons.net|8
183.2.217.17|-|8
192.42.116.179|27.tor-exit.nothingtohide.nl|8
192.42.116.198|8.tor-exit.nothingtohide.nl|8
192.42.116.208|11.tor-exit.nothingtohide.nl|8
207.90.244.2|-|8
222.186.13.132|-|8
5.42.85.5|s1.arakis.site|7
8.216.120.128|-|7
8.216.122.131|-|7
34.124.214.162|162.214.124.34.bc.googleusercontent.com|7
41.242.115.83|-|7
43.135.155.251|-|7
45.118.144.54|-|7
45.119.84.81|-|7
45.148.10.128|-|7
45.148.10.196|-|7
47.117.37.29|-|7
51.8.219.195|azpdesb29.stretchoid.com|7
61.155.106.101|-|7
66.66.116.251|syn-066-066-116-251.res.spectrum.com|7
66.103.222.217|89-20-211-198-dedicated.multacom.com|7
68.116.41.2|syn-068-116-041-002.biz.spectrum.com|7
71.6.135.131|soda.census.shodan.io|7
71.6.146.130|refrigerator.census.shodan.io|7
71.6.146.186|inspire.census.shodan.io|7
71.6.199.23|einstein.census.shodan.io|7
79.110.62.40|-|7
80.82.77.33|sky.census.shodan.io|7
80.82.77.139|dojo.census.shodan.io|7
80.82.77.202|rnd.group-ib.com|7
82.200.65.218|gw-bell-xen.ll-nsk.zsttk.ru|7
83.222.191.62|-|7
89.248.167.131|mason.census.shodan.io|7
91.205.128.170|-|7
91.212.166.37|-|7
92.42.96.51|-|7
92.154.95.236|lstlambert-656-1-48-236.w92-154.abo.wanadoo.fr|7
92.255.85.107|-|7
93.174.95.106|battery.census.shodan.io|7
94.102.49.193|cloud.census.shodan.io|7
94.156.104.80|-|7
94.182.171.4|94-182-171-4.shatel.ir|7
103.63.108.25|static.cmcti.vn|7
103.91.136.18|-|7
103.156.224.210|-|7
103.188.177.46|-|7
103.238.234.237|-|7
109.226.44.144|static.109.226.44.144.ccc.net.il|7
110.49.76.244|-|7
110.175.220.250|110-175-220-250.static.tpgi.com.au|7
112.184.135.67|-|7
114.34.4.112|114-34-4-112.hinet-ip.hinet.net|7
120.28.193.113|-|7
123.60.169.209|ecs-123-60-169-209.compute.hwclouds-dns.com|7
134.122.8.241|-|7
137.184.183.44|-|7
139.59.46.156|-|7
139.59.127.178|-|7
147.185.132.25|-|7
147.185.132.102|-|7
156.227.233.199|-|7
156.238.246.165|-|7
161.35.108.241|-|7
167.99.140.19|-|7
174.138.26.166|-|7
175.205.191.27|-|7
182.72.219.186|nsg-static-186.219.72.182.airtel.in|7
185.74.4.20|-|7
185.142.236.34|hat.census.shodan.io|7
185.165.29.200|-|7
185.220.101.13|berlin01.tor-exit.artikel10.org|7
185.242.226.46|security.criminalip.com|7
186.96.145.241|fixed-186-96-145-241.totalplay.net|7
190.85.15.251|-|7
190.144.14.170|-|7
192.42.116.177|25.tor-exit.nothingtohide.nl|7
192.42.116.178|26.tor-exit.nothingtohide.nl|7
192.42.116.184|32.tor-exit.nothingtohide.nl|7
192.42.116.209|12.tor-exit.nothingtohide.nl|7
192.42.116.210|13.tor-exit.nothingtohide.nl|7
192.42.116.211|14.tor-exit.nothingtohide.nl|7
195.144.21.56|red3.census.shodan.io|7
202.21.123.196|-|7
206.168.34.36|unused-space.coop.net|7
206.168.34.41|unused-space.coop.net|7
206.168.34.43|unused-space.coop.net|7
206.168.34.44|unused-space.coop.net|7
206.168.34.46|unused-space.coop.net|7
206.168.34.48|unused-space.coop.net|7
206.168.34.50|-|7
206.168.34.54|unused-space.coop.net|7
206.168.34.60|unused-space.coop.net|7
206.168.34.116|unused-space.coop.net|7
206.168.34.213|unused-space.coop.net|7
207.90.244.6|-|7
207.90.244.14|-|7
213.6.203.226|-|7
221.222.184.230|-|7
222.102.214.75|-|7
45.141.215.116|tor.moomoo.me|7
45.139.122.176|-|7
