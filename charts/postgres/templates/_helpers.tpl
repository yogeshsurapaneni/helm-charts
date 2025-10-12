# templates/_helpers.tpl

{{/*
Return the chart name
*/}}
{{- define "postgres-shared.name" -}}
{{- .Chart.Name -}}
{{- end }}

{{/*
Return the full name (release-name + chart-name, safe for k8s)
*/}}
{{- define "postgres-shared.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{/*
Return standard labels
*/}}
{{- define "postgres-shared.labels" -}}
app.kubernetes.io/name: {{ include "postgres-shared.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version }}
{{- end }}
