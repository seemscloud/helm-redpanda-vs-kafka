```bash
kafka-producer-perf-test.sh \
    --topic filebeat \
    --num-records 10000000 \
    --record-size 1000 \
    --throughput -1 \
    --producer-props \
        acks=all \
        batch.size=100000 \
        linger.ms=10 \
        compression.type=none \
        bootstrap.servers=redpanda-0.redpanda.default.svc.cluster.local:9092,redpanda-1.redpanda.default.svc.cluster.local:9092,redpanda-2.redpanda.default.svc.cluster.local:9092
```

```bash
kafka-producer-perf-test.sh \
    --topic filebeat \
    --num-records 10000000 \
    --record-size 1000 \
    --throughput -1 \
    --producer-props \
        acks=all \
        batch.size=100000 \
        linger.ms=10 \
        compression.type=none \
        bootstrap.servers=kafka-0.kafka-headless.default.svc.cluster.local:9092,kafka-1.kafka-headless.default.svc.cluster.local:9092,kafka-2.kafka-headless.default.svc.cluster.local:9092
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
    --bootstrap-server=redpanda-0.redpanda.default.svc.cluster.local:9092,redpanda-1.redpanda.default.svc.cluster.local:9092,redpanda-2.redpanda.default.svc.cluster.local:9092
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
    --bootstrap-server=kafka-0.kafka-headless.default.svc.cluster.local:9092,kafka-1.kafka-headless.default.svc.cluster.local:9092,kafka-2.kafka-headless.default.svc.cluster.local:9092
```

```bash
kafka-run-class.sh \
    kafka.tools.EndToEndLatency \
    redpanda-0.redpanda.default.svc.cluster.local:9092,redpanda-1.redpanda.default.svc.cluster.local:9092,redpanda-2.redpanda.default.svc.cluster.local:9092 \
    filebeat 10000000 all 1000
```

```bash
kafka-run-class.sh \
    kafka.tools.EndToEndLatency \
    kafka-0.kafka-headless.default.svc.cluster.local:9092,kafka-1.kafka-headless.default.svc.cluster.local:9092,kafka-2.kafka-headless.default.svc.cluster.local:9092 \
    filebeat 10000000 all 1000
```