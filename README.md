# Charts for Knative

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
[![Artifact Hub](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/ahhhh)](https://artifacthub.io/packages/search?repo=ahhhh)

This repository contains [Helm](https://helm.sh) charts for various knative projects

* [knative-serving](https://github.com/Ahhhh-man/charts/tree/main/charts/knative-serving)
* [kourier](https://github.com/Ahhhh-man/charts/tree/main/charts/kourier)
* [net-kourier](https://github.com/Ahhhh-man/charts/tree/main/charts/net-kourier)
* [net-istio](https://github.com/Ahhhh-man/charts/tree/main/charts/net-istio)
* [knative-eventing](https://github.com/Ahhhh-man/charts/tree/main/charts/knative-eventing)

## Installing Charts from this Repository

Add the Repository to Helm:

```sh
helm repo add ahhhh https://ahhhh-man.github.io/charts
helm repo update
```

Install serving:

```sh
helm install knative-serving ahhhh/knative-serving --namespace knative-serving --create-namespace \
    --set "config.domain.'example\.localhost'=" \
    --set "config.network.ingress-class=istio.ingress.networking.knative.dev"
```

Install networking layer:

```sh
istioctl install -y
helm install net-istio ahhhh/net-istio --namespace knative-serving
```

## License
[Apache 2.0 License](https://github.com/Ahhhh-man/charts/blob/main/LICENSE)
