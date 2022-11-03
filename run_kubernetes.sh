#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
# dockerpath=<>
dockerpath=tinhdh/udacity:v1.0.0

# Step 2
# Run the Docker Hub container with kubernetes
kubectl create deployment --image=$dockerpath tinhdh-udacity-app

# Step 3:
# List kubernetes pods
kubectl get deploy,rs,svc,pods

# Step 4:
# Forward the container port to a host
podname=$(kubectl get pods -l app=tinhdh-udacity-app -o jsonpath={.items[0].metadata.name})
kubectl expose deployment tinhdh-udacity-app --port=80 --name=tinhdh-udacity-http-service
kubectl port-forward $podname 8089:80

