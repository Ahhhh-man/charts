# Knative Eventing Helm Chart

Knative Eventing provides you with helpful tools that can be used to create event-driven applications, by easily attaching event sources, triggers, and other options to your Knative Services.

See the [Knative Eventing documentation](https://knative.dev/docs/eventing/) for more information about Knative Eventing.

## Get Repo Info

```console
helm repo add ahhhh https://ahhhh-man.github.io/charts
helm repo update
```

_See [helm repo](https://helm.sh/docs/helm/helm_repo/) for command documentation._

## Installing the Chart

To install the chart with the release name `knative-eventing`:

```console
helm install knative-eventing ahhhh/knative-eventing --namespace knative-eventing --create-namespace
```

## Uninstalling the Chart

To uninstall/delete the `knative-eventing` deployment:

```console
helm uninstall knative-eventing --namespace knative-eventing
```
