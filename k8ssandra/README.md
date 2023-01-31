```
kubectl create namespace k8ssandra

helm install cert-manager jetstack/cert-manager --namespace cert-manager \
     --create-namespace --set installCRDs=true

helm install k8ssandra-operator k8ssandra/k8ssandra-operator --namespace k8ssandra

kubectl apply -f cluster1-dc1.yaml -n k8ssandra
```