# Kourier Helm Chart

![AppVersion: 1.18.0](https://img.shields.io/badge/AppVersion-1.18.0-informational?style=flat-square)

Knative's Kourier is a lightweight ingress solution for Knative, providing a simple and efficient way to manage ingress traffic for your serverless applications. This chart only includes the Kourier components and requires the net-kourier chart to be installed in the knative-serving namespace.

See the [Kourier Repository](https://github.com/knative-extensions/net-kourier) for more information about Kourier.

## Installing the Chart

To install the chart with the release name `kourier`:

```console
helm install kourier oci://ghcr.io/ahhhh-man/charts/kourier --namespace kourier-system --create-namespace
```

## Uninstalling the Chart

To uninstall/delete the `kourier` deployment:

```console
helm uninstall kourier --namespace kourier-system
```
