{{/*
Expand the name of the chart.
*/}}
{{- define "coolify.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{/*
Create a default fully qualified app name.
*/}}
{{- define "coolify.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end }}

{{/*
Common labels
*/}}
{{- define "coolify.labels" -}}
helm.sh/chart: {{ include "coolify.chart" . }}
{{ include "coolify.selectorLabels" . }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "coolify.selectorLabels" -}}
app.kubernetes.io/name: {{ include "coolify.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Chart label
*/}}
{{- define "coolify.chart" -}}
{{ .Chart.Name }}-{{ .Chart.Version | replace "+" "_" }}
{{- end }}
