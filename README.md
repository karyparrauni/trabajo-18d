# TP18D — GitHub Actions Self-Hosted Runner en Kubernetes local

## Objetivo

Implementar un GitHub Actions Self-Hosted Runner dentro de un clúster Kubernetes local.

## Componentes

- Kubernetes local (k3d/k3s)
- GitHub Actions
- Self-Hosted Runner
- Actions Runner Controller (ARC)
- cert-manager
- GitHub Personal Access Token
- Runners efímeros

## Arquitectura

GitHub Actions se comunica con el runner mediante conexiones salientes HTTPS/443.
No se requiere exponer puertos entrantes del runner hacia Internet.

## Repositorio

`karyparrauni/trabajo-18d`
