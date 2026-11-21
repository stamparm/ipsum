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

Wall of Shame (2026-11-21)
----

|IP|DNS lookup|Number of (black)lists|
|---|---|--:|
138.226.239.233|-|11
138.226.239.234|-|11
193.32.162.15|-|10
45.148.10.61|-|9
62.60.130.148|-|9
3.129.187.38|scan.visionheight.com|8
18.116.101.220|scan.visionheight.com|8
18.218.118.203|scan.visionheight.com|8
45.148.10.141|-|8
45.148.10.151|-|8
66.132.172.41|41.172.132.66.censys-scanner.com|8
66.132.172.99|99.172.132.66.censys-scanner.com|8
66.132.172.133|133.172.132.66.censys-scanner.com|8
66.132.172.193|193.172.132.66.censys-scanner.com|8
66.132.172.207|207.172.132.66.censys-scanner.com|8
66.132.186.195|195.186.132.66.censys-scanner.com|8
66.132.195.66|66.195.132.66.censys-scanner.com|8
66.132.195.96|96.195.132.66.censys-scanner.com|8
74.225.156.91|-|8
77.239.124.252|-|8
80.94.95.115|-|8
102.220.45.186|-|8
104.244.79.113|-|8
106.38.205.224|-|8
119.204.122.94|-|8
125.130.102.172|-|8
151.243.11.28|-|8
151.243.11.168|-|8
199.165.159.65|scan-98-0.shadowserver.io|8
199.165.159.73|scan-60-0.shadowserver.io|8
2.57.121.25|hosting25.tronicsat.com|7
2.57.121.112|dns112.personaliseplus.com|7
35.210.133.203|203.133.210.35.bc.googleusercontent.com|7
35.237.94.18|18.94.237.35.bc.googleusercontent.com|7
45.148.10.5|-|7
45.148.10.125|-|7
45.148.10.152|-|7
45.148.10.157|-|7
45.156.87.189|-|7
46.151.178.14|-|7
50.84.211.204|syn-050-084-211-204.biz.spectrum.com|7
59.6.159.181|-|7
60.199.224.2|60-199-224-2.static.tfn.net.tw|7
61.155.106.101|-|7
62.60.130.219|-|7
64.62.197.2|-|7
64.62.197.17|-|7
64.62.197.32|-|7
64.62.197.48|-|7
64.62.197.77|-|7
64.62.197.107|-|7
64.62.197.122|-|7
64.62.197.137|-|7
65.49.20.67|-|7
66.132.172.34|34.172.132.66.censys-scanner.com|7
66.132.172.43|43.172.132.66.censys-scanner.com|7
66.132.172.46|46.172.132.66.censys-scanner.com|7
66.132.172.97|97.172.132.66.censys-scanner.com|7
66.132.172.101|101.172.132.66.censys-scanner.com|7
66.132.172.128|128.172.132.66.censys-scanner.com|7
66.132.172.137|137.172.132.66.censys-scanner.com|7
66.132.172.143|143.172.132.66.censys-scanner.com|7
66.132.172.176|176.172.132.66.censys-scanner.com|7
66.132.172.178|178.172.132.66.censys-scanner.com|7
66.132.172.180|180.172.132.66.censys-scanner.com|7
66.132.172.181|181.172.132.66.censys-scanner.com|7
66.132.172.186|186.172.132.66.censys-scanner.com|7
66.132.172.191|191.172.132.66.censys-scanner.com|7
66.132.172.194|194.172.132.66.censys-scanner.com|7
66.132.172.205|205.172.132.66.censys-scanner.com|7
66.132.172.206|206.172.132.66.censys-scanner.com|7
66.132.172.209|209.172.132.66.censys-scanner.com|7
66.132.172.211|211.172.132.66.censys-scanner.com|7
66.132.172.218|218.172.132.66.censys-scanner.com|7
66.132.172.221|221.172.132.66.censys-scanner.com|7
66.132.172.222|222.172.132.66.censys-scanner.com|7
66.132.186.162|162.186.132.66.censys-scanner.com|7
66.132.186.175|175.186.132.66.censys-scanner.com|7
66.132.186.176|176.186.132.66.censys-scanner.com|7
66.132.186.179|179.186.132.66.censys-scanner.com|7
66.132.186.180|180.186.132.66.censys-scanner.com|7
66.132.186.187|187.186.132.66.censys-scanner.com|7
66.132.186.190|190.186.132.66.censys-scanner.com|7
66.132.186.194|194.186.132.66.censys-scanner.com|7
66.132.186.196|196.186.132.66.censys-scanner.com|7
66.132.195.34|34.195.132.66.censys-scanner.com|7
66.132.195.41|41.195.132.66.censys-scanner.com|7
66.132.195.44|44.195.132.66.censys-scanner.com|7
66.132.195.47|47.195.132.66.censys-scanner.com|7
66.132.195.52|52.195.132.66.censys-scanner.com|7
66.132.195.53|53.195.132.66.censys-scanner.com|7
66.132.195.63|63.195.132.66.censys-scanner.com|7
66.132.195.74|74.195.132.66.censys-scanner.com|7
66.132.195.75|75.195.132.66.censys-scanner.com|7
66.132.195.80|80.195.132.66.censys-scanner.com|7
66.132.195.84|84.195.132.66.censys-scanner.com|7
66.132.195.86|86.195.132.66.censys-scanner.com|7
66.132.195.91|91.195.132.66.censys-scanner.com|7
66.132.195.93|93.195.132.66.censys-scanner.com|7
66.132.195.97|97.195.132.66.censys-scanner.com|7
66.132.195.98|98.195.132.66.censys-scanner.com|7
66.132.195.108|108.195.132.66.censys-scanner.com|7
66.132.195.111|111.195.132.66.censys-scanner.com|7
66.132.195.112|112.195.132.66.censys-scanner.com|7
66.132.195.126|126.195.132.66.censys-scanner.com|7
71.6.135.131|soda.census.shodan.io|7
71.6.146.130|refrigerator.census.shodan.io|7
72.42.194.230|72-42-194-230.rev.omnicity.net|7
75.156.145.235|d75-156-145-235.abhsia.telus.net|7
79.3.96.178|host-79-3-96-178.business.telecomitalia.it|7
80.94.95.116|-|7
82.96.32.75|-|7
82.127.132.221|lputeaux-656-1-272-221.w82-127.abo.wanadoo.fr|7
83.233.255.240|83-233-255-240.cust.bredband2.com|7
83.235.16.111|goevthes.static.otenet.gr|7
85.11.167.38|-|7
85.217.140.36|o335.scanner.modat.io|7
85.217.149.0|o001.scanner.modat.io|7
85.217.149.41|o041.scanner.modat.io|7
91.230.168.254|noor.probe.onyphe.net|7
92.118.39.78|-|7
93.174.95.106|battery.census.shodan.io|7
95.188.91.101|-|7
102.88.137.80|-|7
102.220.161.79|-|7
102.220.161.171|-|7
109.105.209.12|zl-laxk-us-gp1-wk133a.internet-census.org|7
109.160.32.110|-|7
110.49.76.244|-|7
112.161.27.117|-|7
114.220.238.224|-|7
118.36.222.243|-|7
130.12.181.23|-|7
130.12.182.107|-|7
136.228.161.66|-|7
136.232.11.10|-|7
147.185.133.219|-|7
147.185.133.229|-|7
147.185.133.240|-|7
147.185.133.249|-|7
147.185.133.252|-|7
151.243.11.26|-|7
151.243.11.29|-|7
151.243.11.33|-|7
151.243.11.42|-|7
151.243.11.44|-|7
151.243.11.104|-|7
151.243.11.110|-|7
151.243.11.111|-|7
151.243.11.142|-|7
151.243.11.148|-|7
151.243.11.174|-|7
151.243.11.175|-|7
151.243.11.176|-|7
152.32.236.102|-|7
163.7.11.155|-|7
167.94.146.61|61.146.94.167.censys-scanner.com|7
167.94.146.63|63.146.94.167.censys-scanner.com|7
176.32.193.16|-|7
193.24.211.206|-|7
193.46.255.86|-|7
193.47.62.69|-|7
193.187.110.160|-|7
195.178.110.217|-|7
195.178.110.227|-|7
195.178.110.232|-|7
197.221.232.44|16.44.telone.co.zw|7
199.165.159.217|scan-90-0.shadowserver.io|7
203.55.131.4|-|7
203.252.10.4|-|7
209.99.190.186|-|7
210.103.32.183|-|7
213.177.179.109|-|7
220.80.223.144|-|7
220.247.224.226|-|7
