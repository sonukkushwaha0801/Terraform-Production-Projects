#!/bin/bash

read -p "Enter cluster name: " CLUSTER

aws eks list-nodegroups \
  --cluster-name "$CLUSTER"
