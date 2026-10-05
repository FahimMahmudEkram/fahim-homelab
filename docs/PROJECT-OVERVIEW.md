# Project Overview

## Problem

Running many self-hosted applications on one machine creates practical challenges around networking, storage, security, monitoring, updates, and recovery.

## Solution

This project turns a single Ubuntu Server into a structured self-hosted platform using containerization and a private network overlay.

Instead of exposing many unrelated services directly, the system uses:

- Docker Compose for deployment,
- Caddy for HTTPS and routing,
- Tailscale for private remote access,
- dedicated storage mounts for data,
- Uptime Kuma and Beszel for monitoring,
- Git for configuration history.

## Technologies used

| Area | Technology |
|---|---|
| Operating system | Ubuntu Server |
| Containers | Docker + Docker Compose |
| Reverse proxy | Caddy |
| Remote access | Tailscale |
| Dashboard | Homepage |
| Monitoring | Uptime Kuma, Beszel |
| DNS filtering | AdGuard Home |
| Cloud files | Nextcloud |
| Photos/videos | Immich |
| Documents | Paperless-ngx |
| Password manager | Vaultwarden |
| Personal finance | Firefly III |
| Music server | Navidrome |
| Music client | Feishin |
| File sharing | Samba |
| Metadata management | MusicBrainz Picard |
| Configuration docs | Markdown + Pandoc |
| Host scheduling | systemd + apt timers |

## Computer science concepts demonstrated

This project demonstrates practical CS and systems concepts:

- service decomposition,
- container orchestration,
- network segmentation,
- reverse-proxy routing,
- authentication boundaries,
- persistent storage,
- configuration management,
- observability,
- fault detection,
- automation,
- reproducibility,
- security-by-design.

## Why this project matters

The strongest part of the project is not the number of applications. It is the engineering workflow:

**design → deploy → secure → observe → document → version-control → recover**

That makes the homelab a systems-engineering project rather than simply a collection of applications.

## Suggested live presentation

A 5–10 minute demonstration can show:

1. Homepage dashboard.
2. A service opened through the Caddy/Tailscale route.
3. Uptime Kuma showing service health.
4. Beszel showing CPU/memory/disk metrics.
5. The Git repository demonstrating configuration-as-code.
6. The architecture and security documents.
