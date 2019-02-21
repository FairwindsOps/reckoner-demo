# Reckoner Demo

This repo is intended as a guide and a demo on how to use Reckoner.

## Usage

### Required Software

* linkerd2 cli - https://github.com/linkerd/linkerd2/releases
* kubectl - `brew install kubernetes-cli`
* [reckoner](https://github.com/reactiveops/reckoner) - `pip install -U reckoner`
* helm - `brew install kubernetes-helm`
* [optional] loadimpact k6 - `brew install loadimpact/k6/k6`
* [optional] [rbac-lookup](https://github.com/reactiveops/rbac-lookup) - `brew install reactiveops/tap/rbac-lookup`
*

### `./cluster_setup.sh`

This will bootstrap a GKE cluster.  You will have to set the project name.

### `. setup.sh`

This will install the Tiller in its own namespace and install linkerd. It also creates a cloudflare api token secret for use later.

## course.yml

This is the meat of the demo.  This course.yml will setup all of the tooling in a Kubernetes cluster necessary for an operational cluster.

### External-DNS

A controller to update DNS records based on ingresses and services.

### Prometheus Adapter

Custom metrics provider for Kubernetes that allows scaling on Prometheus metrics from Linkerd2

### Cert Manager

A controller that requests and updates Let's Encrypt Certificates

### Rbac Manager

A controller that manages RBAC bindings and service accounts.

### Nginx Ingress

An ingress controller based on Nginx that provides load balancing and ingress configuration from ingress objects with annotations.

### TICK Stack

A full TICK stack for sending load test data to.  Includes Grafana.

### Vote

A Docker example app that utilizes two frontends, a postgres database, and redis.

### Basic Demo

An app that constantly pings the backend and shows which pods you are connected to.

### Load Generator

An in-cluster load generation tool that can be scaled using replicas.
