#!/bin/bash
export SERVER_1_IP=192.168.50.35
export SERVER_2_IP=192.168.50.36
export SERVER_3_IP=192.168.50.37
export SERVER_1_HOSTNAME=consul-srv-dxb1-01
export SERVER_2_HOSTNAME=consul-srv-dxb1-02
export SERVER_3_HOSTNAME=consul-srv-dxb1-03

hashi-up consul install \
  --ssh-target-addr $SERVER_1_IP \
  --ssh-target-user matthew \
  --server \
  --nodename $SERVER_1_HOSTNAME \
  --client-addr 0.0.0.0 \
  --bootstrap-expect 3 \
  --retry-join $SERVER_1_IP --retry-join $SERVER_2_IP --retry-join $SERVER_3_IP
  
hashi-up consul install \
  --ssh-target-addr $SERVER_2_IP \
  --ssh-target-user matthew \
  --server \
  --nodename $SERVER_2_HOSTNAME \
  --client-addr 0.0.0.0 \
  --bootstrap-expect 3 \
  --retry-join $SERVER_1_IP --retry-join $SERVER_2_IP --retry-join $SERVER_3_IP
  
hashi-up consul install \
  --ssh-target-addr $SERVER_3_IP \
  --ssh-target-user matthew \
  --nodename $SERVER_3_HOSTNAME \
  --server \
  --client-addr 0.0.0.0 \
  --bootstrap-expect 3 \
  --retry-join $SERVER_1_IP --retry-join $SERVER_2_IP --retry-join $SERVER_3_IP