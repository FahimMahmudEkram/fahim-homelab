# Architecture

## Design goals

The architecture is designed around five goals:

1. Keep externally reachable attack surface small.
2. Make services easy to deploy and replace.
3. Separate persistent storage from containers.
4. Centralize HTTPS routing.
5. Keep secrets and runtime data outside version control.

## Traffic flow

### Local access

LAN clients reach the server directly. Internal service ports are not generally published to the LAN; Caddy is used as the main HTTP entry point.

### Remote access

Remote clients first join the Tailscale network. Caddy then exposes the service routes on the server's Tailscale interface.

There is no router port forwarding in the intended design.

## Container layout

Most web applications share an external Docker network named `proxy`. Caddy communicates with the application containers over that network, while application data lives in persistent volumes or bind mounts.

## Storage layout

- `/mnt/music` — Navidrome music library.
- `/mnt/data` — general application data such as Nextcloud/Paperless workloads.
- `/mnt/immich` — Immich media storage.
- `/` — operating system and Docker host.

The exact storage details can be maintained in `inventory.yaml`.

## Port philosophy

The design deliberately avoids exposing every container directly. Instead, selected Caddy listeners provide the user-facing entry points.

For the private service listeners, the reference deployment uses the Tailscale IP and ports `8443–8452`.
