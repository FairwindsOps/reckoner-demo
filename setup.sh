kubectl create clusterrolebinding cluster-admin-binding-awsuderman \
        --clusterrole=cluster-admin --user=AWSuderman@gmail.com

linkerd install --tls optional --proxy-auto-inject --ha --controller-replicas=2 | kubectl apply -f -

kubectl create ns helm-system || true
kubectl create ns infra || true

export TILLER_NAMESPACE=helm-system
kubectl -n "${TILLER_NAMESPACE:-kube-system}" create sa tiller --dry-run -o yaml --save-config | kubectl apply -f -;
kubectl create clusterrolebinding tiller --clusterrole cluster-admin --serviceaccount="${TILLER_NAMESPACE:-kube-system}":tiller --serviceaccount=kube-system:tiller -o yaml --dry-run | kubectl -n "${TILLER_NAMESPACE:-kube-system}" apply -f -

helm init --upgrade --service-account tiller

linkerd check

echo -n $CLOUDFLARE_API_TOKEN > /tmp/api-key
kubectl -n infra delete secret cloudflare-api-key-secret || true
kubectl -n infra create secret generic cloudflare-api-key-secret --from-file=api-key=/tmp/api-key
rm /tmp/api-key
