```bash
helm dependency update

helm upgrade --install observability . -f values.yaml
```

# Delete Filebeats
kubectl delete pod `kubectl  get pods | grep -i filebeat | awk '{print $1}' | xargs` --force

# Grafana
increase(logstash_node_pipeline_events_in_total[1m])
sum(increase(logstash_node_pipeline_events_in_total[1m]))


# RPK
rpk topic create filebeat -r 3 -p 64