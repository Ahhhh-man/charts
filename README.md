# Charts for Knative

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
helm install knative-serving ahhhh/knative-serving
```
