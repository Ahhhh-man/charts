
default:
    @just --list

up:
    k3d cluster create --config k3d.yaml

down:
    k3d cluster delete --config k3d.yaml

restart: down up

alias r:=restart

ct:
    ct lint --config ct.yaml