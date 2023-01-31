Before deploying the Strimzi cluster operator, create a namespace called kafka:
kubectl create namespace kafka


kubectl create -f 'https://strimzi.io/install/latest?namespace=kafka' -n kafka

# Create Kafka cluster
kubectl apply -f kafka-cluster.yaml -n kafka