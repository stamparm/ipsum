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
ipset -q create ipsum hash:net
for ip in $(curl --compressed https://raw.githubusercontent.com/stamparm/ipsum/master/ipsum.txt 2>/dev/null | grep -v "#" | grep -v -E "\s[1-2]$" | cut -f 1); do ipset add ipsum $ip; done
iptables -D INPUT -m set --match-set ipsum src -j DROP 2>/dev/null
iptables -I INPUT -m set --match-set ipsum src -j DROP
```

In directory [levels](levels) you can find preprocessed raw IP lists based on number of blacklist occurrences (e.g. [levels/3.txt](levels/3.txt) holds IP addresses that can be found on 3 or more blacklists).

Wall of Shame (2023-04-07)
----

|IP|DNS lookup|Number of (black)lists|
|---|---|--:|
144.172.73.16|tor-exit4.riverside.rocks|10
51.89.153.112|ns3145504.ip-51-89-153.eu|10
185.56.83.83|onion.xor.sc|10
45.131.111.241|-|10
162.247.74.206|-|9
89.234.157.254|marylou.nos-oignons.net|9
162.247.74.74|wiebe.tor-exit.calyxinstitute.org|9
14.97.52.85|static-85.52.97.14-tataidc.co.in|9
171.25.193.78|tor-exit-read-me.dfri.se|9
211.210.79.220|-|9
45.154.98.173|powered.by.rdp.sh|9
202.90.198.2|-|9
94.131.118.115|vm1052775.stark-industries.solutions|9
171.25.193.20|tor-exit-read-me.dfri.se|9
181.117.240.43|-|9
211.224.63.169|-|9
104.244.76.13|tor-exit-node.spongebob.nicdex.com|9
43.156.205.162|-|9
2.188.229.63|-|9
51.222.86.79|vps-48f58fc2.vps.ovh.ca|9
162.247.74.200|-|8
206.189.136.57|-|8
43.254.41.70|static-43-254-41-70.ctrls.in|8
61.177.173.51|-|8
61.177.173.52|-|8
45.154.98.176|powered.by.rdp.sh|8
103.150.227.10|sdm-media.net|8
211.109.168.34|-|8
193.142.146.135|-|8
103.76.128.200|-|8
54.37.71.177|mail.worker-645.ovh|8
171.25.193.77|tor-exit-read-me.dfri.se|8
115.248.50.84|-|8
8.213.208.151|-|8
212.49.81.249|lbda.co.ke|8
94.230.208.147|tor3e1.digitale-gesellschaft.ch|8
134.122.70.151|ubuntu-sensorysys.com|8
165.232.121.37|-|8
104.244.79.40|tor-exit.deinonychus.deinonychus.xyz|8
45.140.143.53|hosted-by.royalehosting.net|8
162.247.74.27|-|8
179.60.147.143|-|8
162.247.74.217|-|8
146.19.169.228|-|8
92.222.108.86|-|8
197.26.19.193|-|8
171.25.193.25|tor-exit-read-me.dfri.se|8
167.86.94.107|master-of-disaster.tor-exit.laarnes.nl|8
222.186.21.35|-|8
170.17.138.105|105.138.17.170.static.wline.lns.sme.cust.swisscom.ch|8
192.227.190.11|192-227-190-11-host.colocrossing.com|8
198.46.190.229|198-46-190-229-host.colocrossing.com|8
185.241.208.204|-|8
185.241.208.202|-|8
2.58.56.114|powered.by.rdp.sh|8
165.22.106.35|-|8
43.138.35.236|-|8
170.210.208.108|-|8
41.111.178.14|-|8
210.95.97.86|-|8
185.129.62.62|tor01.zencurity.com|8
34.100.211.26|26.211.100.34.bc.googleusercontent.com|8
34.100.189.218|218.189.100.34.bc.googleusercontent.com|8
192.42.116.24|this-is-a-tor-exit-node-hviv124.hviv.nl|8
185.42.170.203|exit01.tor.anduin.net|8
195.226.194.142|-|8
200.46.191.166|166.191.46.200.psinetpa.net|8
185.246.188.67|-|8
114.207.104.104|-|8
61.177.173.36|-|8
61.177.173.39|-|8
43.153.214.221|-|7
45.81.243.193|-|7
43.252.230.62|-|7
184.14.246.92|184-14-246-92.dr03.chtn.wv.frontiernet.net|7
43.156.233.91|-|7
162.247.74.202|djb.tor-exit.calyxinstitute.org|7
162.247.74.204|-|7
71.6.199.23|einstein.census.shodan.io|7
36.112.171.51|-|7
159.223.153.66|-|7
23.129.64.137|-|7
23.95.164.237|23-95-164-237-host.colocrossing.com|7
61.177.173.50|-|7
61.177.173.53|-|7
185.36.81.95|-|7
46.101.226.23|-|7
20.67.248.233|-|7
146.59.44.45|vps-65b1c1c0.vps.ovh.net|7
185.220.102.244|185-220-102-244.torservers.net|7
220.74.102.216|-|7
186.67.248.6|-|7
194.110.203.122|-|7
43.133.102.2|-|7
61.177.172.114|-|7
2.58.56.101|powered.by.rdp.sh|7
159.65.195.20|-|7
23.129.64.210|-|7
35.199.99.139|139.99.199.35.bc.googleusercontent.com|7
20.224.95.78|-|7
198.98.48.192|frost.torexit|7
144.217.86.109|vps-3d00216c.vps.ovh.ca|7
159.65.93.210|952001.cloudwaysapps.com|7
178.20.55.16|marcuse.nos-oignons.net|7
109.122.221.224|-|7
45.235.6.58|45-235-6-58.aknet.net.br|7
143.110.190.205|-|7
45.147.224.11|-|7
162.247.72.199|jaffer.tor-exit.calyxinstitute.org|7
103.251.167.21|tor-exit-at-the.quesadilla.party|7
211.253.10.96|-|7
198.96.155.3|exit.tor.uwaterloo.ca|7
8.219.252.30|-|7
192.42.116.16|tor-exit.hartvoorinternetvrijheid.nl|7
182.16.249.18|ip-182-16-249-18.bmkg.go.id|7
111.230.237.22|-|7
152.89.196.55|-|7
166.70.207.2|this.is.a.tor.node.xmission.com|7
128.199.74.173|-|7
185.246.188.73|-|7
185.246.188.74|-|7
36.91.152.162|-|7
182.73.123.118|-|7
185.246.188.60|-|7
27.254.235.2|-|7
84.239.46.144|-|7
179.208.91.177|b3d05bb1.virtua.com.br|7
124.118.250.228|-|7
193.42.33.113|-|7
23.129.64.134|-|7
185.220.103.7|anatkamm.tor-exit.calyxinstitute.org|7
64.227.180.87|-|7
36.110.228.254|-|7
104.155.236.172|172.236.155.104.bc.googleusercontent.com|7
162.247.74.216|-|7
162.247.74.213|-|7
20.219.149.128|-|7
91.208.75.3|-|7
103.237.144.204|-|7
171.25.193.235|tor-exit-read-me.dfri.se|7
61.177.173.46|-|7
61.177.173.48|-|7
61.177.173.49|-|7
58.64.24.164|-|7
203.199.243.13|illchn-static-203.199.243.13.vsnl.net.in|7
41.111.178.12|-|7
45.180.196.34|static-45-180-196-34.linknetdivinomg.com.br|7
162.247.74.7|-|7
141.98.11.105|srv-141-98-11-105.serveroffer.net|7
185.220.102.250|tor-exit-relay-4.anonymizing-proxy.digitalcourage.de|7
80.67.172.162|algrothendieck.nos-oignons.net|7
103.69.9.7|-|7
203.113.167.3|-|7
20.219.150.38|-|7
180.97.82.230|-|7
179.43.159.194|hostedby.privatelayer.com|7
179.43.159.197|hostedby.privatelayer.com|7
146.59.233.33|vps-f61f0c8d.vps.ovh.net|7
222.168.30.19|-|7
188.171.35.7|cm-188-171-35-7.telecable.es|7
45.129.56.207|-|7
61.177.172.124|-|7
104.236.182.223|editoracip.sfo1|7
185.129.62.63|tor02.zencurity.com|7
61.177.172.98|-|7
185.130.47.58|tor-exit-nl1.privex.cc|7
79.137.86.48|mail.worker-511.ovh|7
176.113.115.113|-|7
104.192.3.74|this-is-a-tor-exit|7
71.6.135.131|soda.census.shodan.io|7
104.236.3.140|-|7
103.195.237.203|-|7
8.222.224.96|-|7
45.139.122.241|-|7
61.177.173.35|-|7
198.98.52.86|bvm.manalshaikh.info|7
61.177.172.19|-|7
