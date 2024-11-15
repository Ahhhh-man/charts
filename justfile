
default:
    @just --list

up:
    k3d cluster create --config k3d.yaml

down:
    k3d cluster delete --config k3d.yaml

restart: down up

alias r:=restart

install: restart
    helm install knative-serving knative-serving \
        --set config.domain."example\.com"=""

uninstall:
    helm uninstall knative-serving

upgrade:
    helm upgrade knative-serving knative-serving \
        --set config.domain."example\.com"="" --set config.domain.abc=""

lint:
    helm lint knative-serving