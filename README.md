# Install

## Deployment

### Cert Manager

```bash
VERSION=`curl -s https://api.github.com/repos/redpanda-data/redpanda/releases/latest | grep tag_name | grep -Po "tag_name\": \"\K[a-z0-9A-Z\.]*"`
kubectl apply -k https://github.com/redpanda-data/redpanda/src/go/k8s/config/crd?ref=$VERSION
```

### Red Panda vs Kafka Stack

```
helm dependency update

helm upgrade --install observability . -f values.yaml
```

## Monitoring

### Grafana

```bash
kubectl get secrets grafana -o go-template --template='{{index .data "admin-password"}}' | base64 -d
```

### Prometheus

```bash
http://prometheus:80
```

## Additionals

# Delete Filebeats

kubectl delete pod `kubectl  get pods | grep -i filebeat | awk '{print $1}' | xargs` --force

# Grafana

increase(logstash_node_pipeline_events_in_total[1m])
sum(increase(logstash_node_pipeline_events_in_total[1m]))

# RPK

rpk topic create filebeat -r 3 -p 64