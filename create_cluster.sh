#!/bin/bash

gcloud beta container \
    clusters create cloud-build \
    --project reactiveopsio \
    --zone us-central1-a \
    --node-locations us-central1-a \
    --machine-type n1-standard-4 \
    --enable-autoscaling \
    --max-nodes 10 \
    --min-nodes 1 \
    --preemptible \
    --enable-autorepair \
    --cluster-version 1.11.8-gke.6 \
    --no-enable-legacy-authorization \
    --enable-cloud-logging \
    --enable-cloud-monitoring \
    --enable-autoupgrade \
    --addons NetworkPolicy \
    --addons HorizontalPodAutoscaling \
    --scopes cloud-platform \
    --enable-vertical-pod-autoscaling \
    --async
