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

Wall of Shame (2026-02-08)
----

|IP|DNS lookup|Number of (black)lists|
|---|---|--:|
128.241.229.30|-|10
195.178.110.15|-|10
61.245.11.87|-|9
91.224.92.108|srv-91-224-92-108.serveroffer.net|9
91.224.92.190|srv-91-224-92-190.serveroffer.net|9
92.118.39.56|-|9
92.118.39.72|-|9
101.36.104.242|-|9
213.209.159.158|-|9
2.57.121.112|dns112.personaliseplus.com|8
2.57.122.238|-|8
45.148.10.141|-|8
45.148.10.147|-|8
45.148.10.151|-|8
45.148.10.152|-|8
45.148.10.157|-|8
64.62.197.152|-|8
64.89.160.47|-|8
66.132.153.135|135.153.132.66.censys-scanner.com|8
80.82.77.33|sky.census.shodan.io|8
80.94.92.171|-|8
89.185.81.112|153823.ip-ptr.tech|8
91.224.92.54|ascrl6.writeresaychooseboltsnow.com|8
91.224.92.78|srv-91-224-92-78.serveroffer.net|8
92.118.39.76|-|8
101.36.123.102|-|8
103.232.121.71|nick8472839|8
103.236.95.173|-|8
103.252.73.37|-|8
162.142.125.112|112.125.142.162.censys-scanner.com|8
162.142.125.192|192.125.142.162.censys-scanner.com|8
167.94.138.48|48.138.94.167.censys-scanner.com|8
167.94.146.53|53.146.94.167.censys-scanner.com|8
176.65.132.23|-|8
204.76.203.233|204.76.203.233.ptr.pfcloud.network|8
213.209.159.159|-|8
2.57.121.25|hosting25.tronicsat.com|7
2.57.122.210|-|7
5.187.97.40|-|7
20.59.121.110|-|7
24.65.233.27|S0106000fff9fa308.ed.shawcable.net|7
34.175.118.185|185.118.175.34.bc.googleusercontent.com|7
35.203.210.171|171.210.203.35.bc.googleusercontent.com|7
40.80.206.215|azpdssqe1x1s.stretchoid.com|7
45.33.80.243|minsk.scan.bufferover.run|7
45.43.37.254|-|7
45.79.181.94|luxembourg.scan.bufferover.run|7
45.91.64.7|-|7
45.148.10.121|-|7
45.227.254.10|-|7
46.151.182.45|-|7
50.149.203.166|c-50-149-203-166.hsd1.tn.comcast.net|7
51.89.166.236|vps-5f0ef624.vps.ovh.net|7
59.12.160.91|-|7
61.50.119.110|-|7
64.62.197.62|-|7
65.49.1.122|-|7
65.49.1.132|-|7
65.49.1.222|-|7
66.132.153.117|117.153.132.66.censys-scanner.com|7
66.132.153.132|132.153.132.66.censys-scanner.com|7
71.6.135.131|soda.census.shodan.io|7
80.82.77.139|dojo.census.shodan.io|7
80.82.77.202|rnd.group-ib.com|7
80.94.92.168|-|7
80.94.95.242|-|7
82.165.66.87|ip82-165-66-87.pbiaas.com|7
85.217.140.3|o303.scanner.modat.io|7
86.54.31.38|blue2.census.shodan.io|7
91.202.233.33|-|7
92.118.39.95|-|7
93.174.95.106|battery.census.shodan.io|7
101.36.65.131|-|7
101.100.194.199|v22081641.sin01.serveradd.com|7
103.103.21.109|ip-109-21-103-103.wjv-1.biznetg.io|7
103.142.62.35|-|7
103.148.118.211|-|7
118.70.178.158|-|7
122.168.194.41|abts-mp-static-041.194.168.122.airtelbroadband.in|7
130.12.180.95|-|7
130.12.180.103|-|7
130.12.180.107|-|7
134.65.30.157|-|7
147.185.132.195|-|7
147.185.133.151|-|7
154.221.27.234|-|7
160.191.243.61|-|7
161.49.89.39|161.49.89.39.convergeict.com|7
161.248.162.15|-|7
162.142.125.38|38.125.142.162.censys-scanner.com|7
162.142.125.43|43.125.142.162.censys-scanner.com|7
162.142.125.117|117.125.142.162.censys-scanner.com|7
162.142.125.125|125.125.142.162.censys-scanner.com|7
162.142.125.207|207.125.142.162.censys-scanner.com|7
162.142.125.209|209.125.142.162.censys-scanner.com|7
162.142.125.215|215.125.142.162.censys-scanner.com|7
162.142.125.216|216.125.142.162.censys-scanner.com|7
162.142.125.223|223.125.142.162.censys-scanner.com|7
162.216.150.168|168.150.216.162.bc.googleusercontent.com|7
167.94.138.187|187.138.94.167.censys-scanner.com|7
167.94.146.48|48.146.94.167.censys-scanner.com|7
167.94.146.49|49.146.94.167.censys-scanner.com|7
167.94.146.52|52.146.94.167.censys-scanner.com|7
167.94.146.56|56.146.94.167.censys-scanner.com|7
167.94.146.57|57.146.94.167.censys-scanner.com|7
167.94.146.59|59.146.94.167.censys-scanner.com|7
167.94.146.62|62.146.94.167.censys-scanner.com|7
167.172.46.57|-|7
172.236.228.86|172-236-228-86.ip.linodeusercontent.com|7
172.236.228.193|172-236-228-193.ip.linodeusercontent.com|7
176.65.134.22|176.65.134.22|7
176.120.22.13|-|7
183.91.11.36|static.cmcti.vn|7
185.129.62.62|tor01.zencurity.com|7
187.16.96.250|mvx-187-16-96-250.mundivox.com|7
190.129.122.185|-|7
197.5.145.8|-|7
206.168.34.40|40.34.168.206.censys-scanner.com|7
220.80.223.144|-|7
220.247.223.56|56.sta.idc-2.slt.lk|7
