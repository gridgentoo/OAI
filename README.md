# Docker Setup - Automated Scripts Installation
ENB and EPC entities can be a single container, however the logical scalable architecture perspective, it is better to be single EPC and many ENB containers.

## Required Software
> $ docker --version

> Docker version 18.09.0, build 4d60db4

> $ docker-compose --version

> docker-compose version 1.23.1, build b02f1306

## Note:
While executing the eNB/EPC if there is a issue like gtp not found. please follow the below mentioned steps. This happens only in 
Version of Ubuntu server 16.04, upto kernel version 14.10. The lowlatency kernel can be found by searching the kernel module gtp.ko that is required to execute the gateway module. 

## if the above is successful, type in the below command and check for gtp and udp_tunnel displayed as below
> $ lsmod | grep gtp  #< Lists more information about gtp and related udp tunnel can be obtained:>

> gtp 28672 0

> udp_tunnel 16384 1 gtp

## Please following the steps for Openairinterface5g (EPC & ENB)

> $ cd /root

> $ git clone https://github.com/kansk/openairinterface5g.git

> $ cd /root/openairinterface5g/oai

> $ chmod 777 launch.sh 

> $ ./launch.sh

## After few seconds, Rx/Tx Lights in the B200 should glow.

## In any changes for the IP address in the configuration files mentioned below (eNB, EPC) and follow the above procedure

> /tmp/oai/conf/mme.conf

> /tmp/oai/conf/spgw.conf

> /tmp/oai/conf/enb.10MHz.b200 and

> /openairinterface5g/oai/ vi docker-compose.yml ( line 20 : ipv4_address and line 37 : ipv4_address )

## Checklist

1, SQN no need to update in users table.

2, HSS.conf op key =”” # need empty.

3,epc container hostname need to insert in to mmeidentity table and update the sqn number in users table.

>INSERT INTO `mmeidentity` VALUES (2,epc.OpenAir5G.Alliance','OpenAir5G.Alliance',0);

>UPDTAE users SET SQN = 00000000000000002112 WHERE IMSI = 208920100001101;

Note: Current sim sqn number value need check from the sim and update in to users table.
Finally, do not forget to change the SQN number into the oai_db.

4, ip address need check all below config files EPC container
>/use/local/etc/oai/mme.conf.

>/use/local/etc/oai/spgw.conf. -	need to change the UE_MTU value and DNS IP Address

ENB container 

>/home/opencells-mods/enb.10MHz.b200.

5, Rx/Tx Lights in the B200 should glow

