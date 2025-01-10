{{/*
Copyright 2024 Ahhhh-man. All rights reserved.
Use of this source code is governed by a BSD-style
license that can be found in the LICENSE file.
*/}}

{{/* vim: set filetype=mustache: */}}

{{/*
Return the proper image name.
If image tag and digest are not defined, termination fallbacks to chart appVersion.
{{ include "common.images.image" ( dict "imageRoot" .Values.path.to.the.image "global" .Values.global "chart" .Chart ) }}
*/}}
{{- define "common.images.image" -}}
{{- $registryName := default .imageRoot.registry ((.global).imageRegistry) -}}
{{- $repositoryName := .imageRoot.repository -}}
{{- $separator := ":" -}}
{{- $termination := .imageRoot.tag | toString -}}

{{- if not .imageRoot.tag }}
  {{- if .chart }}
    {{- $termination = .chart.AppVersion | toString -}}
  {{- end -}}
{{- end -}}
{{- if .imageRoot.digest }}
    {{- $separator = "@" -}}
    {{- $termination = .imageRoot.digest | toString -}}
{{- end -}}
{{- if $registryName }}
    {{- printf "%s/%s%s%s" $registryName $repositoryName $separator $termination -}}
{{- else -}}
    {{- printf "%s%s%s"  $repositoryName $separator $termination -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "knative-eventing.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{/*
Expand the name of the chart.
*/}}
{{- define "knative-eventing.name" -}}
{{- default "knative-eventing" .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Define the version defined by AppVersion 
*/}}
{{- define "knative-eventing.version" -}}
{{- default .Chart.AppVersion | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "knative-eventing.labels" -}}
helm.sh/chart: {{ include "knative-eventing.chart" . }}
app.kubernetes.io/name: {{ include "knative-eventing.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{ include "knative-eventing.selectorLabels" . }}
{{- if or .Chart.AppVersion .Values.image.tag }}
app.kubernetes.io/version: {{ include "knative-eventing.version" . }}
{{- end }}
{{- with .Values.commonLabels }}
{{ toYaml . }}
{{- end }}
{{- end }}

{{/*
Common annotations
*/}}
{{- define "knative-eventing.annotations" -}}
{{- with .Values.commonAnnotations }}
{{ toYaml . }}
{{- end }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "knative-eventing.selectorLabels" -}}
app.kubernetes.io/name: {{ include "knative-eventing.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Return the proper controller image name
*/}}
{{- define "knative-eventing.controller.image" -}}
{{- include "common.images.image" (dict "imageRoot" .Values.controller.image "global" .Values.global) -}}
{{- end -}}

{{/*
Return the proper apiserver receive adapter image name
*/}}
{{- define "knative-eventing.apiserverReceiveAdapter.image" -}}
{{- include "common.images.image" (dict "imageRoot" .Values.controller.apiserverReceiveAdapter.image "global" .Values.global) -}}
{{- end -}}

{{/*
Return the proper jobsink image name
*/}}
{{- define "knative-eventing.jobsink.image" -}}
{{- include "common.images.image" (dict "imageRoot" .Values.jobsink.image "global" .Values.global) -}}
{{- end -}}

{{/*
Return the proper Pingsource MT Adapter image name
*/}}
{{- define "knative-eventing.mtping.image" -}}
{{- include "common.images.image" (dict "imageRoot" .Values.mtping.image "global" .Values.global) -}}
{{- end -}}

{{/*
Return the proper Webhook image name
*/}}
{{- define "knative-eventing.webhook.image" -}}
{{- include "common.images.image" (dict "imageRoot" .Values.webhook.image "global" .Values.global) -}}
{{- end -}}
