
default:
    @just --list

up:
    k3d cluster create --config k3d.yaml

down:
    k3d cluster delete --config k3d.yaml

restart: down up

alias r:=restart

install: restart
    helm install knative-serving knative-serving -f knative-serving/values.yaml

uninstall:
    helm uninstall knative-serving

upgrade:
    helm upgrade --install knative-serving knative-serving -f knative-serving/values.yaml

lint:
    helm lint knative-serving