# Reckoner Demo

This repo is intended as a guide and a demo on how to use Reckoner.

Accompanies these [slides](https://sudermanjr.com/slides/reckoner)

## Usage

### Required Software

* linkerd2 cli - https://github.com/linkerd/linkerd2/releases
* kubectl - `brew install kubernetes-cli`
* reckoner - `pip install -U reckoner`
* helm - `brew install kubernetes-helm`
* [optional] loadimpact k6 - `brew install loadimpact/k6/k6`

### `./cluster_setup.sh`

This will bootstrap a GKE cluster.  You will have to set the project name.

### `. setup.sh`

This will install the Tiller in its own namespace and install linkerd. It also creates a cloudflare api token secret for use later.

## course.yml

This is the meat of the demo.  This course.yml will setup all of the tooling in a Kubernetes cluster necessary for an operational cluster.

### External-DNS

A controller to update DNS records based on ingresses and services.

### Prometheus Adapter

### Cert Manager

### Rbac Manager

### External DNS

### Nginx Ingress

### TICK Stack

### Vote

### Basic Demo

### Load Generator
