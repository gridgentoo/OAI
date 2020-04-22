#!/bin/sh
cd /tmp
mkdir oai
cd oai
mkdir conf
cd /root/OAI/oai
cp conf/* /tmp/oai/conf/
docker-compose up
