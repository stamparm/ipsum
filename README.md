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

Wall of Shame (2026-09-05)
----

|IP|DNS lookup|Number of (black)lists|
|---|---|--:|
2.57.121.112|dns112.personaliseplus.com|10
77.90.185.20|-|10
2.57.122.53|-|9
31.58.216.82|82.216.58.31.hosted-by.vpslayer.net|9
62.60.130.253|-|9
129.121.128.70|129-121-128-70.unifiedlayer.com|9
193.47.62.69|-|9
195.178.110.232|-|9
2.57.121.25|hosting25.tronicsat.com|8
2.57.122.238|-|8
3.131.220.121|scan.visionheight.com|8
18.218.118.203|scan.visionheight.com|8
62.60.130.201|-|8
62.60.130.242|-|8
66.132.172.35|35.172.132.66.censys-scanner.com|8
66.132.172.176|176.172.132.66.censys-scanner.com|8
66.132.172.211|211.172.132.66.censys-scanner.com|8
66.132.186.163|163.186.132.66.censys-scanner.com|8
66.132.186.167|167.186.132.66.censys-scanner.com|8
66.132.186.187|187.186.132.66.censys-scanner.com|8
66.132.195.68|68.195.132.66.censys-scanner.com|8
66.132.195.92|92.195.132.66.censys-scanner.com|8
77.239.124.130|-|8
95.85.245.227|vds16931.1cent.network|8
107.150.97.10|-|8
138.226.239.233|-|8
167.94.146.62|62.146.94.167.censys-scanner.com|8
182.18.161.165|static-182-18-161-165.ctrls.in|8
192.227.221.227|192-227-221-227-host.colocrossing.com|8
193.46.255.86|-|8
220.76.68.23|-|8
220.80.223.144|-|8
221.161.235.168|-|8
3.130.168.2|scan.visionheight.com|7
5.182.83.231|undefined.hostname.localhost|7
16.5.0.244|embnex.com|7
43.153.205.159|-|7
45.17.39.120|-|7
45.123.110.70|-|7
45.148.10.141|-|7
45.148.10.152|-|7
45.148.10.157|-|7
45.156.129.80|sh-chi-us-gp1-wk105a.internet-census.org|7
46.188.119.26|broadband-46-188-119-26.2com.net|7
64.62.156.94|-|7
64.62.156.192|-|7
64.62.156.222|-|7
64.62.197.137|-|7
64.62.197.167|-|7
64.62.197.182|-|7
65.49.1.152|-|7
65.49.1.202|-|7
65.49.1.232|-|7
66.132.172.40|40.172.132.66.censys-scanner.com|7
66.132.172.43|43.172.132.66.censys-scanner.com|7
66.132.172.44|44.172.132.66.censys-scanner.com|7
66.132.172.46|46.172.132.66.censys-scanner.com|7
66.132.172.97|97.172.132.66.censys-scanner.com|7
66.132.172.129|129.172.132.66.censys-scanner.com|7
66.132.172.132|132.172.132.66.censys-scanner.com|7
66.132.172.133|133.172.132.66.censys-scanner.com|7
66.132.172.140|140.172.132.66.censys-scanner.com|7
66.132.172.177|177.172.132.66.censys-scanner.com|7
66.132.172.181|181.172.132.66.censys-scanner.com|7
66.132.172.183|183.172.132.66.censys-scanner.com|7
66.132.172.190|190.172.132.66.censys-scanner.com|7
66.132.172.194|194.172.132.66.censys-scanner.com|7
66.132.172.198|198.172.132.66.censys-scanner.com|7
66.132.172.199|199.172.132.66.censys-scanner.com|7
66.132.172.209|209.172.132.66.censys-scanner.com|7
66.132.172.222|222.172.132.66.censys-scanner.com|7
66.132.186.164|164.186.132.66.censys-scanner.com|7
66.132.186.166|166.186.132.66.censys-scanner.com|7
66.132.186.183|183.186.132.66.censys-scanner.com|7
66.132.186.190|190.186.132.66.censys-scanner.com|7
66.132.195.32|32.195.132.66.censys-scanner.com|7
66.132.195.54|54.195.132.66.censys-scanner.com|7
66.132.195.55|55.195.132.66.censys-scanner.com|7
66.132.195.56|56.195.132.66.censys-scanner.com|7
66.132.195.59|59.195.132.66.censys-scanner.com|7
66.132.195.60|60.195.132.66.censys-scanner.com|7
66.132.195.66|66.195.132.66.censys-scanner.com|7
66.132.195.69|69.195.132.66.censys-scanner.com|7
66.132.195.87|87.195.132.66.censys-scanner.com|7
66.132.195.95|95.195.132.66.censys-scanner.com|7
66.132.195.96|96.195.132.66.censys-scanner.com|7
66.132.195.101|101.195.132.66.censys-scanner.com|7
66.132.195.124|124.195.132.66.censys-scanner.com|7
66.132.224.235|235.224.132.66.censys-scanner.com|7
68.178.166.175|175.166.178.68.host.secureserver.net|7
79.3.96.178|host-79-3-96-178.business.telecomitalia.it|7
80.94.92.55|-|7
81.192.46.36|adsl-36-46-192-81.adsl.iam.net.ma|7
81.192.46.45|adsl-45-46-192-81.adsl.iam.net.ma|7
85.239.149.72|-|7
86.54.31.34|wine.census.shodan.io|7
88.147.30.59|88-147-30-59.static.eolo.it|7
91.196.152.39|serrano.probe.onyphe.net|7
92.118.39.14|-|7
92.118.39.49|-|7
92.118.39.50|-|7
92.118.39.77|-|7
93.152.221.206|-|7
93.174.95.106|battery.census.shodan.io|7
95.58.255.251|95.58.255.251.static.telecom.kz|7
95.173.161.147|slufse.accordinar.online|7
102.220.160.124|-|7
103.78.2.252|-|7
103.143.231.24|-|7
103.205.107.170|-|7
103.229.125.91|-|7
114.30.180.58|-|7
116.114.84.246|-|7
116.114.94.242|-|7
117.50.195.206|-|7
130.12.182.107|-|7
136.232.11.10|-|7
138.226.239.234|-|7
144.225.6.182|-|7
147.185.132.204|-|7
148.66.132.204|204.132.66.148.host.secureserver.net|7
163.7.3.154|-|7
167.94.146.48|48.146.94.167.censys-scanner.com|7
167.94.146.53|53.146.94.167.censys-scanner.com|7
167.94.146.58|58.146.94.167.censys-scanner.com|7
167.94.146.63|63.146.94.167.censys-scanner.com|7
177.229.197.38|customer-PUE-MCA-197-38.megared.net.mx|7
179.184.85.167|-|7
182.93.50.90|n18293z50l90.static.ctmip.net|7
185.132.43.9|-|7
192.169.232.223|223.232.169.192.host.secureserver.net|7
195.178.110.217|-|7
195.178.110.218|-|7
197.221.232.44|16.44.telone.co.zw|7
199.45.154.56|56.154.45.199.censys-scanner.com|7
199.45.154.127|127.154.45.199.censys-scanner.com|7
201.76.120.30|30.120.76.201.in-addr.arpa.verointernet.com.br|7
203.150.107.244|244.107.150.203.sta.inet.co.th|7
207.166.168.11|-|7
207.166.172.198|-|7
211.20.14.156|211-20-14-156.hinet-ip.hinet.net|7
213.209.159.230|-|7
220.85.210.200|-|7
220.90.220.204|-|7
222.107.156.227|-|7
222.108.100.117|-|7
