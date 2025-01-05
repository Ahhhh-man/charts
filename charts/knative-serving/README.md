# Knative Serving Helm Chart

Knative Serving builds on Kubernetes to support deploying and serving of applications and functions as serverless containers.

See the [Knative Serving documentation](https://knative.dev/docs/serving/) for more information about Knative Serving.

## Get Repo Info

```console
helm repo add ahhhh https://ahhhh-man.github.io/charts
helm repo update
```

_See [helm repo](https://helm.sh/docs/helm/helm_repo/) for command documentation._

## Installing the Chart

To install the chart with the release name `knative-serving`:

```console
helm install knative-serving ahhhh/knative-serving --namespace knative-serving --create-namespace \
    --set "config.domain.'example\.localhost'=" \
    --set "config.network.ingress-class=istio.ingress.networking.knative.dev"
```

> Note: The defaullt network layer is Istio but must be installed seperately. The net-istio chart is available in this repository.

## Uninstalling the Chart

To uninstall/delete the `knative-serving` deployment:

```console
helm uninstall knative-serving --namespace knative-serving
```
