# Order of Demo

1. `./create_cluster.sh` - Create Cluster
1. `. setup.sh` - Installs Tiller, Sets up Cloudflare secrets
1. `reckoner plot course-infra.yaml` - Creates infra resources
1. `kubectl get clusterissuer` - Check to make sure the cluster issuer got created correctly
1. `reckoner plot course-demos.yaml` - Creates demo apps
1. [demo link](https://meetup.sudermanjr.com) - Once DNS is propagated, this should work.
1. `kubectl -n demo get ingress basic-demo -oyaml` - Show ingress with annotations
1. `stern -n external-dns dns -c dns` - Show logs on external-dns controller and explain how it is working
1. `stern -n cert-manager cert -c cert` -  Show logs on cert-manager and explain how it is working
1. `vi manifests/rbacdefinition.yaml` - Show rbacdefinition.yaml
1. `rbac-lookup circleci -o wide` - Show the SA that rbac-manager has created and the rolebindings.
1. Go to demo app that should now have DNS, TLS, and autoscaling
1. `kubectl get hpa -n demo` - Show the scaling.
1. (If time) - Show off a little with Linkerd2 and metrics scaling
