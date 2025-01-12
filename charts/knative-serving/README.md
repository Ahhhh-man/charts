# Knative Serving Helm Chart

Knative Serving builds on Kubernetes to support deploying and serving of applications and functions as serverless containers.

See the [Knative Serving documentation](https://knative.dev/docs/serving/) for more information about Knative Serving.

## Installing the Chart

To install the chart with the release name `knative-serving`:

```console
helm install knative-serving oci://ghcr.io/ahhhh-man/charts/knative-serving --namespace knative-serving --create-namespace \
    --set "config.domain.'example\.localhost'=" \
    --set "config.network.ingress-class=istio.ingress.networking.knative.dev"
```

> Note: The default network layer is Istio but must be installed separately. The net-istio chart is available in this repository.

## Uninstalling the Chart

To uninstall/delete the `knative-serving` deployment:

```console
helm uninstall knative-serving --namespace knative-serving
```
