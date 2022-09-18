VERSION=`curl -s https://api.github.com/repos/redpanda-data/redpanda/releases/latest | grep tag_name | grep -Po "tag_name\": \"\K[a-z0-9A-Z\.]*"`
kubectl apply -k https://github.com/redpanda-data/redpanda/src/go/k8s/config/crd?ref=$VERSION

helm dependency update
helm upgrade --install redpanda . -f values.yaml