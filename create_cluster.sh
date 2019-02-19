#!/bin/bash

gcloud container \
    --project reactiveopsio \
    clusters create reckoner-demo \
    --zone us-central1-a \
    --node-locations us-central1-a \
    --machine-type n1-standard-4 \
    --enable-autoscaling \
    --max-nodes 20 \
    --min-nodes 1 \
    --preemptible \
    --enable-autorepair \
    --cluster-version 1.11.7-gke.4 \
    --no-enable-legacy-authorization \
    --enable-cloud-logging \
    --enable-cloud-monitoring \
    --enable-autoupgrade \
    --addons NetworkPolicy \
    --addons HorizontalPodAutoscaling \
    --scopes cloud-platform \
    --async
