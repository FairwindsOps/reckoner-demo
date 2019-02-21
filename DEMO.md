# Order of Demo

1. `./create_cluster.sh` - Create Cluster
1. `. setup.sh` - Installs Tiller, Sets up Cloudflare secrets
1. `reckoner plot course-infra.yaml` - Creates infra resources
1. `reckoner plot course-demo.yaml` - Creates demo apps
1. Show ingress with annotations
1. Show logs on external-dns controller and explain how it is working
1. Show logs on cert-manager and explain how it is working
1. Show rbacdefinition.yaml and go through the SA that it has created and the rolebindings.  Show rbac-lookup
1. Give URL to demo app that should now have DNS, TLS, and autoscaling
1. (If time) - Show off a little with Linkerd2 and metrics scaling
