#!/bin/bash

for i in `seq 0 4` ; do
    helm uninstall "producer${i}"
done

for i in `seq 1 100` ; do
  kubectl delete pods --force `kubectl  get pods  | grep -i producer | awk '{print $1}' | head -12 | xargs`
done