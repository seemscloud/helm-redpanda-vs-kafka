helm dependency update
helm upgrade --install redpanda . -f values.yaml
kubectl apply -f redpanda.yaml