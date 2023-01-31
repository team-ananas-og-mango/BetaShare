kubectl create -f https://github.com/jetstack/cert-manager/releases/download/v1.8.2/cert-manager.yaml

helm repo add flink-operator-repo https://downloads.apache.org/flink/flink-kubernetes-operator-1.4.0/
kubectl create namespace flink
helm install flink-kubernetes-operator flink-operator-repo/flink-kubernetes-operator --namespace flink

kubectl get pods -n flink

kubectl create -f flink-job.yaml -n flink

To expose the Flink Dashboard you may add a port-forward rule or look the ingress configuration options:
kubectl port-forward svc/basic-example-rest 8081 -n flink