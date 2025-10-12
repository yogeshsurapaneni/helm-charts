{{- define "grocy.fullname" -}}
{{- $name := default .Chart.Name .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- printf "%s-%s" .Release.Name $name -}}
{{- end -}}

{{- define "grocy.labels" -}}
app.kubernetes.io/name: {{ .Chart.Name }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
app.kubernetes.io/managed-by: Helm
{{- end -}}
