# Charts for Knative

[![Artifact Hub](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/ahhhh)](https://artifacthub.io/packages/search?repo=ahhhh)

This repository contains [Helm](https://helm.sh) charts for various knative projects

* [knative-serving](charts/knative-serving/)
* [net-kourier](charts/net-kourier/)
* [knative-eventing](charts/knative-eventing/)

## Installing Charts from this Repository

Add the Repository to Helm:

```sh
helm repo add ahhhh https://ahhhh-man.github.io/charts
```

Install a Chart:

```sh
helm install knative-serving ahhhh/knative-serving --namespace knative-serving --create-namespace \
    --set "config.domain.'example\.localhost'=" \
    --set "config.network.ingress-class=kourier.ingress.networking.knative.dev"
```
