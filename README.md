# DevOps Portfolio — Automated Scripts and Docker Infrastructure

Este repositorio documenta el recorrido integrador de **18 Trabajos Prácticos (TPs)** en administración de sistemas, infraestructura en la nube, contenedorización, orquestación con Kubernetes y un pipeline completo de **DevSecOps** para la **Notes App** (aplicación de notas basada en microservicios).

---

## 🛠️ Stack Tecnológico

| Capa / Dominio | Tecnologías Utilizadas |
|---|---|
| **Sistema Operativo & Scripting** | Linux (Debian/Ubuntu), Bash, cron |
| **Control de Versiones & GitOps** | Git, Gitflow, GitHub Actions, Gitleaks, git-filter-repo |
| **Contenedores & Microservicios** | Docker, Docker Compose, Multi-stage Builds, Docker Hub |
| **Orquestación & K8s** | Kubernetes (k3s/k3d), Helm 3, NGINX Ingress Controller, HPA |
| **Infraestructura como Código (IaC)** | Terraform (módulos, state, HCL) |
| **Monitoreo & Observabilidad** | Prometheus, Grafana, Node Exporter, cAdvisor |
| **Seguridad & DevSecOps (SAST/DAST/SCA)** | OWASP ZAP, Threagile, Semgrep, Trivy, Gitleaks |
| **Vulnerability Management** | OWASP DefectDojo Community Edition (API v2) |

---

## 🚀 Resumen de Trabajos Prácticos (TP01 a TP18)

### 🔹 Fundamentos y Administración Linux (TP01 – TP04)
* **TP01 — Scripting Bash y Automatización:** Script de administración del sistema en Bash para automatizar 3 tareas clave: respaldo con timestamp, limpieza de logs antiguos y reporte de salud (CPU, memoria, disco). Autenticación SSH/PAT y publicación en GitHub.
* **TP02 — Gestión de Usuarios y Principio de Menor Privilegio:** Configuración del usuario de sistema `devops-deploy` y grupo `deploy-team` con permisos granulares (`750`/`770`), sin privilegios de `sudo`, y script de auditoría de seguridad.
* **TP03 — Flujo de Trabajo con Gitflow:** Implementación del modelo de ramas de Gitflow (`main`, `develop`, `feature/*`, `release/*`, `hotfix/*`), commits de merge no fast-forward (`--no-ff`) para trazabilidad de PRs y versionado SemVer (`v1.0`, `v1.1`).
* **TP04 — Configuración YAML y Diagnóstico de Red:** Esquema YAML multi-entorno (`dev`, `staging`, `prod`) según 12-Factor App, y script de diagnóstico de red (`ping`, `traceroute`, `dig`, `curl`, `ss`, `ip route`).

### 🔹 Contenedores, CI/CD y Monitoreo (TP05 – TP08)
* **TP05 — Containerización de API Python con Docker:** Construcción de una API Flask en Docker con imagen base liviana (`python:3.12-slim`), optimización de caché de capas, usuario no-root (`appuser`), servidor Gunicorn y publicación en Docker Hub.
* **TP06 — Microservicios Multi-Contenedor con Docker Compose:** Despliegue de la **Notes App** con 3 servicios: Frontend Nginx (proxy inverso), Backend Flask (multi-stage build) y Base de Datos PostgreSQL con volumen persistente y comprobaciones de salud (`healthcheck`).
* **TP07 — Pipeline CI/CD Automatizado con GitHub Actions:** Pipeline de CI/CD en GitHub Actions con fases de Linting (`flake8`, `yamllint`), Testing con `pytest` y cobertura, compilación multi-plataforma y publicación en Docker Hub con la política Lean *Andon Cord*.
* **TP08 — Stack de Monitoreo con Prometheus y Grafana:** Instrumentación de la app Flask con `prometheus_client` (métricas Counter, Histogram, Gauge), recolectores Node Exporter y cAdvisor, reglas de alerta (`alerts.yml`) y provisioning de dashboards en Grafana.

### 🔹 Orquestación en Kubernetes e IaC (TP09 – TP12)
* **TP09 — Despliegue Multi-Tier en Kubernetes:** Despliegue declarativo en Kubernetes (Namespaces, Secrets Base64, ConfigMaps, PersistentVolumeClaim de 1Gi, Deployments con réplicas y probes de `readiness`/`liveness`, y Services ClusterIP y NodePort `:30080`).
* **TP10 — Helm Charts e Ingress Controller:** Empaquetado mediante un Chart de Helm personalizado (`devops-portfolio`), helpers reutilizables (`_helpers.tpl`), reinicio automático por hash (`checksum/config`), autoscaling (HPA) y valores desacoplados (`values-dev.yaml` / `values-prod.yaml`).
* **TP11 — Infraestructura como Código (IaC) con Terraform:** Provisionamiento de infraestructura Docker con Terraform. Estructura modularizada (`network`, `storage`, `app`), aislamiento de entornos y gestión del archivo de estado (`terraform.tfstate`).
* **TP12 — Portfolio Centralizado y Salud de Repositorios:** Unificación del ecosistema completo de repositorios, matriz técnica de competencias, automatización del pipeline de validación (`portfolio-check.yml`) y diseño de perfil profesional de GitHub.

### 🔹 Ciberseguridad Automatizada y DevSecOps (TP13 – TP17)
* **TP13 (13B/13C) — Pruebas Dinámicas DAST con OWASP ZAP:** Automatización de escaneos DAST con OWASP ZAP Automation Framework en Kubernetes y CI/CD. Rastreo dinámico (Spider tradicional y AJAX), ataques activos (`activeScan`), fuzzing de API, manejo seguro de credenciales con GitHub Secrets y exportación SARIF sanitizada hacia GitHub Code Scanning.
* **TP14 — Modelado Declarativo de Amenazas con Threagile:** Implementación de *Threat Modeling as Code* con `threagile.yaml`. Declaración de activos de información (`data_assets`), activos técnicos (`technical_assets`), flujos de datos (`data_flows`) y límites de confianza (`trust_boundaries`) para auditoría de riesgos en CI/CD.
* **TP15 — Análisis Estático SAST Multilenguaje con Semgrep:** Inspección estática con Semgrep sobre código Python/Flask (OWASP Top 10), Dockerfiles, HCL de Terraform y manifiestos de Kubernetes con política *Andon Cord*.
* **TP16 — Escaneo Multidominio con Trivy (SCA, Container & IaC):** Escaneo estático de dependencias de terceros (`requirements.txt`), capas de imágenes inmutables de contenedor e Infraestructura como Código renderizada previamente con el patrón "Render First, Validate Second" (TP10B).
* **TP17 — Detección de Secretos en Git con Gitleaks:** Detección de credenciales y claves en el historial completo de commits mediante inspección de firmas Regex y Entropía de Shannon. Configuración de `.gitleaks.toml`, hooks pre-commit locales y purgado con `git-filter-repo`.

---

## TP18 — Gestión Centralizada de Vulnerabilidades con OWASP DefectDojo

Integración de **OWASP DefectDojo Community Edition** para consolidar, desduplicar y auditar los hallazgos de ciberseguridad provenientes de OWASP ZAP (DAST), Threagile (Threat Modeling), Semgrep (SAST), Trivy (SCA/Container/IaC) y Gitleaks (Secret Scanning).

### Arquitectura de Integración en 4 Fases

| Fase | Herramienta | Función | Mecanismo |
|---|---|---|---|
| **Fase 1** | Docker Buildx | Compilación inmutable | Exporta `app-image.tar` |
| **Fase 2** | OWASP ZAP / Threagile / Semgrep / Trivy / Gitleaks | Auditoría multidominio | Genera reportes JSON/XML estructurados |
| **Fase 3** | OWASP DefectDojo | Vulnerability Management | Ingestión vía API v2 y deduplicación |
| **Fase 4** | Helm & K8s | Despliegue a producción | Release verificado en Kubernetes |



---
## TP18B — OWASP DefectDojo

### Objetivo

TP18B integra los resultados de seguridad de los trabajos anteriores en **OWASP DefectDojo**, centralizando los hallazgos de:

- OWASP ZAP
- Threagile
- Semgrep
- Trivy
- Gitleaks

### Integración

La integración se realizó mediante **GitHub Actions** y la **API v2 de DefectDojo**.

El producto configurado fue **Notes App**, con el engagement **CI/CD Automated Security Audits**.

Los reportes utilizados fueron:

- `reports-json/zap-results.json`
- `reports-json/threagile-results.json`
- `reports-json/semgrep-results.json`
- `reports-json/trivy-container-results.json`
- `reports-json/gitleaks-report.json`

La importación se realizó mediante la API `/api/v2/reimport-scan/`, utilizando `close_old_findings=true`.

La etapa de importación utiliza `if: always()` para permitir la consolidación de resultados aunque alguna herramienta de seguridad encuentre vulnerabilidades.

### DefectDojo local

DefectDojo se ejecutó en Kubernetes, dentro del namespace `defectdojo`.

El acceso local se realizó mediante:

`kubectl port-forward -n defectdojo svc/defectdojo-django 8082:80`

Durante TP18B, GitHub Actions utilizó runners hospedados por GitHub. Para permitir el acceso desde GitHub Actions hacia el DefectDojo local se utilizó temporalmente un túnel HTTPS.

### Secrets

Las credenciales se mantuvieron fuera del repositorio mediante GitHub Secrets, principalmente:

- `DEFECTDOJO_URL`
- `DEFECTDOJO_API_KEY`
- `DOCKERHUB_USERNAME`
- `DOCKERHUB_TOKEN`

### Resultado

TP18B permitió centralizar los resultados de seguridad de los trabajos anteriores en DefectDojo y automatizar su importación mediante GitHub Actions.

Esta implementación sirvió como base para TP18D, donde el acceso a DefectDojo evolucionó hacia comunicación interna de Kubernetes mediante runners **self-hosted efímeros administrados por ARC**.

## TP18D — GitHub Actions Self-Hosted Runner en Kubernetes local

### Objetivo

Implementar un **GitHub Actions Self-Hosted Runner** dentro de un clúster Kubernetes local, utilizando **Actions Runner Controller (ARC)** y runners efímeros.

### Componentes

- Kubernetes local basado en k3d/k3s
- GitHub Actions
- Actions Runner Controller (ARC)
- GitHub Actions Runner Scale Set
- GitHub Personal Access Token almacenado como Secret de Kubernetes
- Runners efímeros

### Arquitectura

GitHub Actions delega la ejecución de los jobs seleccionados a runners administrados por ARC dentro del clúster Kubernetes.

El flujo implementado utiliza un **Runner Scale Set** denominado `arc-runner-set`. Cuando GitHub Actions necesita ejecutar un job con:

```yaml
runs-on: arc-runner-set
```

ARC crea un runner efímero dentro del namespace `arc-runners`. Al finalizar el job, el runner es eliminado.

La comunicación con GitHub se realiza mediante conexiones salientes HTTPS/443. No se requiere exponer puertos entrantes del runner hacia Internet.

Para la comunicación con DefectDojo se utiliza directamente el DNS interno de Kubernetes:

```text
http://defectdojo-django.defectdojo.svc.cluster.local
```

No se utiliza ngrok para esta comunicación.

### Seguridad

- Credenciales almacenadas mediante Kubernetes Secrets.
- El GitHub Personal Access Token no se versiona en el repositorio.
- Runners efímeros para reducir la persistencia del entorno de ejecución.
- Ejecución del runner con usuario no root.
- Recursos CPU y memoria limitados.
- Principio de menor privilegio.
- No se versionan credenciales ni manifiestos renderizados que puedan contener secretos.

### Recursos del runner

| Recurso | Request | Limit |
|---|---:|---:|
| CPU | 200m | 2000m |
| Memoria | 512Mi | 2Gi |

### Configuración del Runner Scale Set

El Runner Scale Set se desplegó mediante el chart OCI oficial de Actions Runner Controller:

```text
gha-runner-scale-set
```

Versión utilizada:

```text
0.15.1
```

Configuración:

| Parámetro | Valor |
|---|---|
| Scale Set | `arc-runner-set` |
| Namespace | `arc-runners` |
| Versión ARC | `0.15.1` |
| Runner mínimo | `0` |
| Runner máximo | `1` |
| URL de GitHub | `https://github.com/karyparrauni/trabajo-18d` |

Con `minRunners: 0`, no se mantienen runners permanentemente activos. El runner se crea cuando GitHub Actions asigna un job al Scale Set.

### Entorno

| Recurso | Configuración |
|---|---|
| Repositorio | `karyparrauni/trabajo-18d` |
| Rama | `main` |
| Kubernetes | k3s `v1.31.5+k3s1` |
| Namespace ARC Controller | `arc-systems` |
| Namespace Runners | `arc-runners` |
| Runner Scale Set | `arc-runner-set` |
| ARC chart | `0.15.1` |
| Helm | `v3.18.4` |
| Runner mínimo | `0` |
| Runner máximo | `1` |

### Workflow de prueba del Self-Hosted Runner

Se implementó el workflow:

```text
.github/workflows/self-hosted-runner-test.yml
```

El workflow utiliza:

```yaml
runs-on: arc-runner-set
```

y verifica:

- Nombre del runner.
- Sistema operativo.
- Arquitectura.
- Hostname.
- Usuario y UID/GID.
- Entorno Linux.
- Acceso interno a DefectDojo.
- Finalización correcta del job.

La ejecución comprobó que el runner funciona correctamente dentro de Kubernetes y que se ejecuta con el usuario no root `runner`.

Una vez finalizado el job, el pod efímero del runner es eliminado, confirmando el comportamiento esperado del Runner Scale Set.

### Integración con DefectDojo

La Fase 3 del pipeline de seguridad fue modificada para utilizar el Self-Hosted Runner:

```yaml
defectdojo-import:
  runs-on: arc-runner-set
```

Esta fase recibe los reportes generados por las auditorías de seguridad y los importa mediante la API v2 de DefectDojo.

Las credenciales se obtienen desde GitHub Actions Secrets:

```text
DEFECTDOJO_URL
DEFECTDOJO_API_KEY
```

La URL utilizada dentro del clúster es:

```text
http://defectdojo-django.defectdojo.svc.cluster.local
```

Se verificó mediante un workflow independiente que el Self-Hosted Runner puede acceder correctamente al servicio DefectDojo utilizando el DNS interno de Kubernetes.

### Pipeline de seguridad

El workflow principal:

```text
.github/workflows/defectdojo-ci.yml
```

se organiza en cuatro fases:

1. **Fase 1 — Build & Package**
   - Ejecutada en `ubuntu-latest`.
   - Construcción y empaquetado de la aplicación.

2. **Fase 2 — Auditorías**
   - Ejecutada en `ubuntu-latest`.
   - Threagile.
   - Semgrep.
   - Trivy.
   - Gitleaks.
   - Generación de reportes JSON.

3. **Fase 3 — Centralización en DefectDojo**
   - Ejecutada en `arc-runner-set`.
   - Descarga de los reportes.
   - Importación mediante la API de DefectDojo.
   - Ejecución sobre el Self-Hosted Runner desplegado por ARC.

4. **Fase 4 — Release & Deploy Helm K8s**
   - Ejecutada en `ubuntu-latest`.
   - Preparación de la imagen y tareas asociadas al release.
   - El comando efectivo de despliegue Helm permanece comentado en el workflow actual, por lo que esta fase no se documenta como un despliegue real realizado por GitHub Actions.

### Resultado

El pipeline completo se ejecutó correctamente después de integrar el Self-Hosted Runner.

La ejecución utilizada como evidencia fue:

```text
Run ID: 42952926365
```

Las cuatro fases finalizaron con estado `success`.

La Fase 3 fue ejecutada sobre:

```text
arc-runner-set
```

demostrando la integración entre **GitHub Actions, ARC, Kubernetes local y DefectDojo**.

El runner fue creado para ejecutar el job y posteriormente eliminado, manteniendo el carácter efímero de la infraestructura.
