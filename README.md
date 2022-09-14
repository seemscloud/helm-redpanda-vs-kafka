```bash
kubectl get secrets monitoring-grafana -o go-template --template='{{index .data "admin-password"}}' | base64 -d

kubectl delete pod `kubectl  get pods | grep -i filebeat | awk '{print $1}' | xargs` --force
```

```bash
sum(rate(vectorized_kafka_rpc_received_bytes[1m])/1000/1000)
sum(rate(kafka_server_brokertopicmetrics_total_bytesinpersec_count[1m])/1000/1000)
```

```bash
sum(rate(vectorized_kafka_rpc_sent_bytes[1m])/1000/1000)
sum(rate(kafka_server_brokertopicmetrics_total_bytesoutpersec_count[1m])/1000/1000)
```

```bash
rpk topic delete filebeat

rpk topic create filebeat \
  --replicas 3 \
  --partitions 60 \
  --topic-config retention.ms=36000000 \
  --topic-config retention.bytes=-1
```

```bash
for i in `seq 1 100` ; do
  kubectl delete pods --force `kubectl  get pods  | grep -i producer | awk '{print $1}' | head -10 | xargs`
done
```