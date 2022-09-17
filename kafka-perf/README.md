```bash
kafka-producer-perf-test.sh \
    --topic filebeat \
    --num-records 10000000 \
    --record-size 1000 \
    --throughput -1 \
    --producer-props \
        acks=all \
        batch.size=16384 \
        linger.ms=0 \
        compression.type=gzip \
        bootstrap.servers=kafka-0:9092,kafka-1:9092,kafka-2:9092
```

```bash
kafka-consumer-perf-test.sh \
    --topic filebeat \
    --messages=10000000 \
    --fetch-size=1 \
    --from-latest \
    --reporting-interval=1 \
    --group testing \
    --print-metrics \
    --show-detailed-stats \
    --bootstrap-server=kafka-0:9092,kafka-1:9092,kafka-2:9092
```

```bash
kafka-run-class.sh \
    kafka.tools.EndToEndLatency \
    kafka-0:9092,kafka-1:9092,kafka-2:9092 \
    filebeat 10000000 all 1000
```

```bash
redpanda-0.redpanda.default.svc.cluster.local,redpanda-1.redpanda.default.svc.cluster.local,redpanda-2.redpanda.default.svc.cluster.local
kafka-0.kafka-headless.default.svc.cluster.local,kafka-1.kafka-headless.default.svc.cluster.local,kafka-2.kafka-headless.default.svc.cluster.local
```