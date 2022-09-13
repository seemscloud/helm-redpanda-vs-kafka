#!/bin/bash

for i in `seq 0 4` ; do
    helm uninstall "producer${i}"
done