# Helm Chart for Elastic-Fluentd-Kibana logging

**This fork is designed to be used for local development using minikube**

- Installs a complete logging solution for Kubernetes nodes, based on this [Kubernetes Addon](https://github.com/kubernetes/kubernetes/tree/master/cluster/addons/fluentd-elasticsearch)

## Installing

Create any namespace to install EFK into:

```bash
kubectl create namespace XXXXXXX
```

Install release version (see release [here](https://github.com/srfrnk/efk-stack-helm/releases)), w.g. 1.0.13:

```bash
kubectl apply -n <NAMESPACE FOR EFK> -f https://github.com/srfrnk/efk-stack-helm/releases/download/<RELEASE>/efk-manifests-<RELEASE>.yaml
```

You can also add the following to your setup script to wait for cluster to be ready:

```bash
kubectl wait -n <NAMESPACE FOR EFK> --for=condition=complete --timeout=600s job/initializer
echo "Now you can run: kubectl port-forward -n <NAMESPACE FOR EFK> svc/efk-kibana 5601"
echo "Then you can view in browser: open http://localhost:5601/app/discover"
```

## Development

1. Clone repo
1. Setup a minikube cluster
1. Run `make minikube-test`
