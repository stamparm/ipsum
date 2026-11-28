![Logo](https://i.imgur.com/PyKLAe7.png)

[![License](https://img.shields.io/badge/license-The_Unlicense-red.svg)](https://unlicense.org/)

About
----

**IPsum** is a threat intelligence feed based on 30+ different publicly available [lists](https://github.com/stamparm/maltrail) of suspicious and/or malicious IP addresses, like [IPnoise](https://ipnoise.sekuripy.hr/). All lists are automatically retrieved and parsed on a daily (every 24 hours) basis and the final result is pushed to this repository. The feed contains IP addresses plus an occurrence count (how many source lists each IP appears on). Higher counts generally mean higher confidence and fewer false positives when blocking inbound traffic. Also, list is sorted by occurrence count (highest to lowest).

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

Wall of Shame (2026-11-28)
----

|IP|DNS lookup|Number of (black)lists|
|---|---|--:|
64.62.197.32|-|9
86.54.31.34|wine.census.shodan.io|9
92.207.4.157|-|9
102.220.161.85|-|9
103.159.199.43|ip-103-159-199-43.moratelindo.net.id|9
103.248.120.6|-|9
193.47.62.149|-|9
193.47.62.152|-|9
193.47.62.153|-|9
2.57.121.25|hosting25.tronicsat.com|8
2.57.121.112|dns112.personaliseplus.com|8
27.102.116.43|-|8
35.206.150.39|39.150.206.35.bc.googleusercontent.com|8
35.206.151.191|191.151.206.35.bc.googleusercontent.com|8
35.206.167.114|114.167.206.35.bc.googleusercontent.com|8
35.210.24.61|61.24.210.35.bc.googleusercontent.com|8
35.210.73.217|217.73.210.35.bc.googleusercontent.com|8
45.148.10.61|-|8
58.182.58.128|-|8
58.221.60.25|-|8
62.60.134.201|undefined.hostname.localhost|8
64.62.197.48|-|8
64.62.197.62|-|8
65.49.1.24|-|8
66.132.186.180|180.186.132.66.censys-scanner.com|8
66.132.186.199|199.186.132.66.censys-scanner.com|8
66.132.195.93|93.195.132.66.censys-scanner.com|8
66.132.195.100|100.195.132.66.censys-scanner.com|8
66.132.195.113|113.195.132.66.censys-scanner.com|8
93.123.109.116|-|8
102.220.45.186|-|8
102.220.161.171|-|8
104.244.79.113|-|8
119.204.122.94|-|8
125.130.102.172|-|8
167.94.146.53|53.146.94.167.censys-scanner.com|8
167.94.146.61|61.146.94.167.censys-scanner.com|8
182.93.50.90|n18293z50l90.static.ctmip.net|8
187.16.96.250|mvx-187-16-96-250.mundivox.com|8
193.47.62.147|-|8
209.99.190.186|-|8
220.80.223.144|-|8
1.238.106.229|-|7
2.57.122.166|-|7
3.129.187.38|scan.visionheight.com|7
18.116.101.220|scan.visionheight.com|7
18.218.118.203|scan.visionheight.com|7
20.65.202.190|azpdsskwls6c.stretchoid.com|7
34.3.84.41|-|7
35.206.141.203|203.141.206.35.bc.googleusercontent.com|7
35.206.163.19|19.163.206.35.bc.googleusercontent.com|7
35.206.178.11|11.178.206.35.bc.googleusercontent.com|7
35.210.12.136|136.12.210.35.bc.googleusercontent.com|7
35.210.18.21|21.18.210.35.bc.googleusercontent.com|7
35.210.22.77|77.22.210.35.bc.googleusercontent.com|7
35.210.36.43|43.36.210.35.bc.googleusercontent.com|7
35.210.72.68|68.72.210.35.bc.googleusercontent.com|7
35.210.125.55|55.125.210.35.bc.googleusercontent.com|7
35.210.149.174|174.149.210.35.bc.googleusercontent.com|7
35.210.160.35|35.160.210.35.bc.googleusercontent.com|7
35.210.160.81|81.160.210.35.bc.googleusercontent.com|7
35.210.203.235|235.203.210.35.bc.googleusercontent.com|7
35.210.213.124|124.213.210.35.bc.googleusercontent.com|7
35.210.216.67|67.216.210.35.bc.googleusercontent.com|7
35.210.220.9|9.220.210.35.bc.googleusercontent.com|7
35.210.228.188|188.228.210.35.bc.googleusercontent.com|7
35.210.239.143|143.239.210.35.bc.googleusercontent.com|7
35.210.240.68|68.240.210.35.bc.googleusercontent.com|7
35.210.254.82|82.254.210.35.bc.googleusercontent.com|7
36.64.68.99|-|7
36.67.227.241|-|7
41.111.227.10|-|7
45.156.87.50|-|7
45.156.128.176|sh-ams-nl-gp6-wk131a.internet-census.org|7
45.156.129.60|sh-chi-us-gp1-wk101a.internet-census.org|7
45.156.129.70|sh-chi-us-gp1-wk103a.internet-census.org|7
46.151.178.14|-|7
47.254.192.213|-|7
62.60.130.148|-|7
62.193.91.121|-|7
64.62.197.2|-|7
64.62.197.107|-|7
64.62.197.137|-|7
64.62.197.152|-|7
64.62.197.182|-|7
64.62.197.197|-|7
64.62.197.227|-|7
65.49.1.10|-|7
65.49.1.52|-|7
65.49.1.142|-|7
65.49.1.162|-|7
65.49.20.67|-|7
66.132.172.105|105.172.132.66.censys-scanner.com|7
66.132.172.135|135.172.132.66.censys-scanner.com|7
66.132.172.138|138.172.132.66.censys-scanner.com|7
66.132.172.139|139.172.132.66.censys-scanner.com|7
66.132.172.140|140.172.132.66.censys-scanner.com|7
66.132.172.143|143.172.132.66.censys-scanner.com|7
66.132.172.178|178.172.132.66.censys-scanner.com|7
66.132.172.188|188.172.132.66.censys-scanner.com|7
66.132.172.194|194.172.132.66.censys-scanner.com|7
66.132.172.201|201.172.132.66.censys-scanner.com|7
66.132.172.209|209.172.132.66.censys-scanner.com|7
66.132.172.218|218.172.132.66.censys-scanner.com|7
66.132.186.178|178.186.132.66.censys-scanner.com|7
66.132.186.183|183.186.132.66.censys-scanner.com|7
66.132.186.195|195.186.132.66.censys-scanner.com|7
66.132.186.196|196.186.132.66.censys-scanner.com|7
66.132.195.55|55.195.132.66.censys-scanner.com|7
66.132.195.62|62.195.132.66.censys-scanner.com|7
66.132.195.82|82.195.132.66.censys-scanner.com|7
66.132.195.96|96.195.132.66.censys-scanner.com|7
66.132.195.103|103.195.132.66.censys-scanner.com|7
66.132.195.116|116.195.132.66.censys-scanner.com|7
66.132.195.122|122.195.132.66.censys-scanner.com|7
66.132.224.229|229.224.132.66.censys-scanner.com|7
66.132.224.241|241.224.132.66.censys-scanner.com|7
69.5.169.118|69-5-169-118.infrawat.ch|7
71.27.86.44|-|7
79.3.96.178|host-79-3-96-178.business.telecomitalia.it|7
80.82.77.33|sky.census.shodan.io|7
81.192.46.45|adsl-45-46-192-81.adsl.iam.net.ma|7
83.168.110.192|hosted-by.SkillHost.PL|7
83.233.255.240|83-233-255-240.cust.bredband2.com|7
85.217.149.20|o021.scanner.modat.io|7
86.54.31.32|hat.census.shodan.io|7
88.142.46.185|185.46.142.88.rev.sfr.net|7
91.196.152.104|esparza.probe.onyphe.net|7
92.27.101.99|host-92-27-101-99.static.as13285.net|7
92.118.39.49|-|7
92.118.39.56|-|7
92.118.39.71|-|7
93.152.221.36|-|7
93.152.221.43|-|7
93.174.95.106|battery.census.shodan.io|7
96.78.175.36|-|7
98.157.226.99|syn-098-157-226-099.res.spectrum.com|7
102.220.161.173|-|7
103.20.122.54|-|7
103.91.246.101|-|7
103.155.47.50|-|7
103.194.243.199|-|7
104.244.74.84|-|7
106.51.92.114|106.51.92.114.actcorp.in|7
109.105.210.77|zl-dfwc-us-gp5-wk101a.internet-census.org|7
113.193.234.210|-|7
116.71.136.125|-|7
118.194.228.101|-|7
123.58.198.35|-|7
123.58.213.20|-|7
124.18.182.99|124-18-182-99.area54b.commufa.jp|7
147.185.132.21|-|7
147.185.132.76|-|7
147.185.132.237|-|7
147.185.133.0|-|7
152.32.182.8|-|7
154.221.25.205|-|7
163.7.11.126|-|7
167.94.146.54|54.146.94.167.censys-scanner.com|7
167.94.146.56|56.146.94.167.censys-scanner.com|7
167.94.146.59|59.146.94.167.censys-scanner.com|7
185.226.197.27|zl-amsc-nl-gp1-wk127a.internet-census.org|7
185.226.197.40|zl-amsc-nl-gp1-wk129d.internet-census.org|7
187.174.238.116|customer-187-174-238-116.uninet-ide.com.mx|7
191.210.72.37|191-210-72-37.user.vivozap.com.br|7
193.46.255.86|-|7
193.47.62.148|-|7
193.187.110.158|-|7
195.178.110.159|-|7
195.178.110.217|-|7
195.178.110.227|-|7
195.178.110.228|-|7
197.221.232.44|16.44.telone.co.zw|7
198.235.24.41|-|7
199.165.159.9|scan-91-0.shadowserver.io|7
199.165.159.17|scan-92-0.shadowserver.io|7
199.165.159.41|scan-95-0.shadowserver.io|7
199.165.159.57|scan-97-0.shadowserver.io|7
199.165.159.73|scan-60-0.shadowserver.io|7
199.165.159.105|scan-64-0.shadowserver.io|7
199.165.159.121|scan-66-0.shadowserver.io|7
199.165.159.129|scan-67-0.shadowserver.io|7
199.165.159.145|scan-81-0.shadowserver.io|7
199.165.159.177|scan-85-0.shadowserver.io|7
199.165.159.217|scan-90-0.shadowserver.io|7
201.77.124.248|201-77-124-248.static.desktop.com.br|7
202.103.157.115|-|7
202.165.25.8|-|7
203.252.10.4|-|7
210.103.32.183|-|7
216.180.246.127|crawler127.deepfield.net|7
221.156.126.1|-|7
221.161.235.168|-|7
222.107.156.227|-|7
