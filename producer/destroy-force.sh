for i in `seq 1 100` ; do
  kubectl delete pods --force `kubectl  get pods  | grep -i producer | awk '{print $1}' | head -10 | xargs`
done