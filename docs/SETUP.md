# Setup Guide

This repository is a **configuration and documentation project**, not a backup of the running server.

## Prerequisites

- Ubuntu Server host
- Docker Engine
- Docker Compose
- Tailscale
- Persistent disks mounted at the paths required by the Compose files
- A Docker network named `proxy`

Create the shared network once:

```bash
docker network create proxy
```

If it already exists, Docker will report that; that is fine.

## 1. Clone the repository

```bash
git clone <YOUR_GITHUB_REPOSITORY_URL>
cd fahim-homelab
```

For a private repository, authenticate to GitHub before cloning.

## 2. Review configuration

Search for placeholders:

```bash
grep -RniE 'CHANGE_ME|<TAILSCALE_HOST>|<TAILSCALE_IP>|<LAN_IP>' .
```

Replace placeholders with values appropriate to your environment.

## 3. Create local secret files

Never commit the real versions.

Copy the available examples:

```bash
cp firefly/.env.example firefly/.env
cp firefly/.db.env.example firefly/.db.env
cp paperless/.env.example paperless/.env
cp paperless/docker-compose.env.example paperless/docker-compose.env
cp immich/.env.example immich/.env
cp nextcloud/db.env.example nextcloud/db.env
```

Populate real values locally.

## 4. Prepare persistent storage

Create and verify the intended mount points:

```bash
findmnt /mnt/music
findmnt /mnt/data
findmnt /mnt/immich
```

Do not replace an existing production mount with a temporary directory.

## 5. Start services

Each application is maintained in its own directory. Start one stack at a time so failures are easy to isolate.

Example:

```bash
cd caddy
docker compose up -d
```

Then repeat for the service directories you plan to deploy.

## 6. Verify

Check containers:

```bash
docker ps
```

Check the reverse proxy:

```bash
docker logs caddy --tail 100
```

Check the private network:

```bash
tailscale status
```

## 7. Validate before every Git push

From the repository root:

```bash
./scripts/git-preflight.sh
git status
```

## Recovery principle

Git should reconstruct the **configuration**.

Backups should restore the **data**.

Keep those two responsibilities separate.
