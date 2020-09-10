start:
	# start cluster
	k3d cluster create --no-lb --k3s-server-arg --disable --k3s-server-arg traefik default

	# install istio
	istioctl install

	# deploy assets
	kubectl apply -Rf assets

test:
	curl 172.23.0.2

delete:
	k3d cluster delete default
