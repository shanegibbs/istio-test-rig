# Istio Test Setup

* Tried on linux
* Creates a local k3s cluster in docker with k3d
* Deploys istio and addons
* Deploys gateway config and test app

Requirements:

* k3d https://github.com/rancher/k3d#get
* istioctl https://github.com/istio/istio/releases/tag/1.7.0

```shell
# kick things off
make start

# install grafana, prometheus and friends
make istio-addons

# test the app works
make test

# view various dashboards
istioctl dashboard grafana
istioctl dashboard jaeger
istioctl dashboard kiali
```
