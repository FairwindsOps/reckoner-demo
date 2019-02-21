#!/bin/bash

## Deletes all the resources created by the demo

kubectl delete crd rbacdefinitions.rbacmanager.reactiveops.io
kubectl delete -f https://raw.githubusercontent.com/jetstack/cert-manager/release-0.6/deploy/manifests/00-crds.yaml
kubectl delete -f manifests/

export TILLER_NAMESPACE=helm-system
helm delete --purge alerts \
    basic-demo \
    cert-manager \
    dash \
    data \
    external-dns \
    grafana \
    hosts \
    load-generator \
    nginx-ingress \
    polling \
    prometheus-adapter \
    rbac-manager \
    vote

kubectl delete ns tick demo cert-manager external-dns load nginx-ingress rbac-manager vote
