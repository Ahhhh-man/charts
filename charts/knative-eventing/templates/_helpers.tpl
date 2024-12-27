{{/*
Copyright 2024 Ahhhh-man. All rights reserved.
Use of this source code is governed by a BSD-style
license that can be found in the LICENSE file.
*/}}

{{/* vim: set filetype=mustache: */}}


{{/*
Define the version defined by AppVersion 
*/}}
{{- define "knative-eventing.version" -}}
{{- default .Chart.AppVersion | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}
