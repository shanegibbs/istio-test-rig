start:
	# start cluster
	k3d cluster create --no-lb --k3s-server-arg --disable --k3s-server-arg traefik default

	# install istio
	istioctl install -y

	# enable injection
	kubectl label namespace default istio-injection=enabled

	# deploy assets
	kubectl apply -Rf assets

	# validate
	istioctl analyze

istio-dump:
	istioctl profile dump

istio-addons:
	kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.7/samples/addons/prometheus.yaml
	kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.7/samples/addons/grafana.yaml
	kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.7/samples/addons/jaeger.yaml
	kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.7/samples/addons/kiali.yaml

test:
	curl $(shell docker inspect k3d-default-server-0 |jq -r '.[0].NetworkSettings.Networks["k3d-default"].IPAddress')

delete:
	k3d cluster delete default
