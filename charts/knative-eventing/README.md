# Knative Eventing Helm Chart

Knative Eventing provides you with helpful tools that can be used to create event-driven applications, by easily attaching event sources, triggers, and other options to your Knative Services.

See the [Knative Eventing documentation](https://knative.dev/docs/eventing/) for more information about Knative Eventing.

## Installing the Chart

To install the chart with the release name `knative-eventing`:

```console
helm install knative-eventing oci://ghcr.io/ahhhh-man/charts/knative-eventing --namespace knative-eventing --create-namespace
```

## Uninstalling the Chart

To uninstall/delete the `knative-eventing` deployment:

```console
helm uninstall knative-eventing --namespace knative-eventing
```
