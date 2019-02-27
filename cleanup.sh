#!/bin/bash

## Deletes all the resources created by the demo

kubectl delete crd rbacdefinitions.rbacmanager.reactiveops.io 2> /dev/null || true
kubectl delete -f https://raw.githubusercontent.com/jetstack/cert-manager/release-0.6/deploy/manifests/00-crds.yaml 2> /dev/null || true
kubectl delete -f manifests/ 2> /dev/null || true

export TILLER_NAMESPACE=helm-system
for chart in " basic-demo" \
    "cert-manager" \
    "dash" \
    "data" \
    "external-dns" \
    "grafana" \
    "hosts" \
    "load-generator" \
    "nginx-ingress" \
    "polling" \
    "prometheus-adapter" \
    "rbac-manager" \
    "basic-demo" \
    "vote"; do
  helm delete --purge "$chart" 2> /dev/null || true ;
done

kubectl delete ns tick demo cert-manager external-dns load nginx-ingress rbac-manager vote 2> /dev/null || true
