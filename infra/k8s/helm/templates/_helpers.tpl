# {{- define "my-app-chart.name" -}}
# {{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
# {{- end -}}

# {{- define "my-app-chart.fullname" -}}
# {{- $name := default .Chart.Name .Values.nameOverride -}}
# {{- if .Values.fullnameOverride -}}
# {{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
# {{- else -}}
# {{- if and .Values.nameOverride (not (eq .Values.nameOverride "")) -}}
# {{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
# {{- else -}}
# {{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
# {{- end -}}
# {{- end -}}
# {{- end -}}


# {{/*
# Create a default fully qualified app name.
# We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
# If release name contains chart name it will be used as a full name.
# */}}
# {{- define "local.fullname" -}}
# {{- if .Values.fullnameOverride }}
# {{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
# {{- else }}
# {{- $name := default .Chart.Name .Values.nameOverride }}
# {{- if contains $name .Release.Name }}
# {{- .Release.Name | trunc 63 | trimSuffix "-" }}
# {{- else }}
# {{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
# {{- end }}
# {{- end }}
# {{- end }}

# {{/*
# Create chart name and version as used by the chart label.
# */}}
# {{- define "local.chart" -}}
# {{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
# {{- end }}

# {{/*
# Common labels
# */}}
# {{- define "local.labels" -}}
# helm.sh/chart: {{ include "local.chart" . }}
# {{ include "local.selectorLabels" . }}
# {{- if .Chart.AppVersion }}
# app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
# {{- end }}
# app.kubernetes.io/managed-by: {{ .Release.Service }}
# {{- end }}

# {{/*
# Selector labels
# */}}
# {{- define "local.selectorLabels" -}}
# app.kubernetes.io/name: {{ include "local.name" . }}
# app.kubernetes.io/instance: {{ .Release.Name }}
# {{- end }}

# {{/*
# Create the name of the service account to use
# */}}
# {{- define "local.serviceAccountName" -}}
# {{- if .Values.serviceAccount.create }}
# {{- default (include "local.fullname" .) .Values.serviceAccount.name }}
# {{- else }}
# {{- default "default" .Values.serviceAccount.name }}
# {{- end }}
# {{- end }}
