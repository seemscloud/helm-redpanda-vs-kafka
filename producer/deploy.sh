helm dependency update

for i in `seq 0 4` ; do
    helm upgrade --install "producer${i}" . \
        -f values.yaml \
        --set "producer.fullnameOverride=producer${i}" \
        --set "producer.replicas=100" \
        --set "producer.extraVolumes[0].name=snapshot" \
        --set "producer.extraVolumes[0].persistentVolumeClaim.claimName=snapshot${i}"
done