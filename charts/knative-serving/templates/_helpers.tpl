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
{{- define "knative-serving.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{/*
Expand the name of the chart.
*/}}
{{- define "knative-serving.name" -}}
{{- default "knative-serving" .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Define the version defined by AppVersion 
*/}}
{{- define "knative-serving.version" -}}
{{- default .Chart.AppVersion | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "knative-serving.labels" -}}
helm.sh/chart: {{ include "knative-serving.chart" . }}
app.kubernetes.io/name: {{ include "knative-serving.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{ include "knative-serving.selectorLabels" . }}
{{- if or .Chart.AppVersion .Values.image.tag }}
app.kubernetes.io/version: {{ include "knative-serving.version" . }}
{{- end }}
{{- with .Values.commonLabels }}
{{ toYaml . }}
{{- end }}
{{- end }}

{{/*
Common annotations
*/}}
{{- define "knative-serving.annotations" -}}
{{- with .Values.commonAnnotations }}
{{ toYaml . }}
{{- end }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "knative-serving.selectorLabels" -}}
app.kubernetes.io/name: {{ include "knative-serving.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}


{{/*
Return the proper activator image name
*/}}
{{- define "knative-serving.activator.image" -}}
{{- include "common.images.image" (dict "imageRoot" .Values.activator.image "global" .Values.global) -}}
{{- end -}}

{{/*
Return the proper autoscaler image name
*/}}
{{- define "knative-serving.autoscaler.image" -}}
{{- include "common.images.image" (dict "imageRoot" .Values.autoscaler.image "global" .Values.global) -}}
{{- end -}}

{{/*
Return the proper controller image name
*/}}
{{- define "knative-serving.controller.image" -}}
{{- include "common.images.image" (dict "imageRoot" .Values.controller.image "global" .Values.global) -}}
{{- end -}}

{{/*
Return the proper webhook image name
*/}}
{{- define "knative-serving.webhook.image" -}}
{{- include "common.images.image" (dict "imageRoot" .Values.webhook.image "global" .Values.global) -}}
{{- end -}}

{{/*
Formats imagePullSecrets. Input is (dict "root" . "imagePullSecrets" .{specific imagePullSecrets})
*/}}
{{- define "knative-serving.imagePullSecrets" -}}
{{- $root := .root }}
{{- range (concat .root.Values.global.imagePullSecrets .imagePullSecrets) }}
{{- if eq (typeOf .) "map[string]interface {}" }}
- {{ toYaml (dict "name" (tpl .name $root)) | trim }}
{{- else }}
- name: {{ tpl . $root }}
{{- end }}
{{- end }}
{{- end }}
