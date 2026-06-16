#!/bin/bash

kubectl apply -f namespace.yaml

kubectl apply -f cm.yaml

kubectl apply -f secret.yaml

kubectl apply -f fe-deploy.yaml
kubectl apply -f fe-service.yaml

kubectl apply -f be-deploy.yaml
kubectl apply -f be-service.yaml

kubectl apply -f ai-engine-deployment.yaml
kubectl apply -f ai-engine-service.yaml

kubectl apply -f ingress.yaml

kubectl apply -f hpa.yaml
