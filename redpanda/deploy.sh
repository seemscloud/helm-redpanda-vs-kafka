helm dependency update
helm upgrade --install redpanda . -f values.yaml
echo "sleep 10 seconds for operator waiting for operator"
sleep 10
kubectl apply -f redpanda.yaml