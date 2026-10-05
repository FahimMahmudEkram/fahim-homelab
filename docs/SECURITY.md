# Security Design

## Security objectives

The project is designed to protect:

- remote access to self-hosted applications,
- administrative interfaces,
- credentials and API tokens,
- personal documents, photos, finances, passwords, and media,
- the integrity of the Ubuntu host.

## Controls implemented

### 1. Private remote access

Tailscale is used as the remote-access layer. The reference deployment does not rely on router port forwarding for the homelab services.

### 2. Reverse proxy

Caddy provides HTTPS and a central routing point instead of exposing every application directly.

### 3. SSH restriction

SSH is bound only to the intended LAN and Tailscale interfaces. This reduces accidental exposure through other interfaces.

### 4. SMB restriction

The Samba music share is bound to the LAN/Tailscale interfaces and requires authentication. The minimum supported SMB protocol is SMB2.

### 5. Secret separation

The live deployment contains credentials in environment files and application state. Those files are intentionally excluded from Git.

Examples:

- database passwords,
- application secret keys,
- API keys,
- tokens,
- private keys.

### 6. Runtime-state exclusion

Databases, WAL/SHM files, application directories, generated state, and backups do not belong in source control.

### 7. Automatic OS updates

Ubuntu package lists and unattended security updates are scheduled automatically. Automatic reboot is disabled so service availability remains a deliberate operator decision.

### 8. Monitoring

Uptime Kuma provides service availability monitoring. Beszel provides host/resource monitoring and SMART-based disk health visibility.

## Threat model

The design primarily reduces risk from:

- accidentally exposing admin interfaces to the public Internet,
- leaking credentials through Git repositories,
- losing service configuration,
- silent disk failures,
- undetected service outages.

It does **not** eliminate all risk. Application vulnerabilities, weak passwords, compromised client devices, and stolen Tailscale credentials remain important threats.

## Git safety rule

Before every push:

```bash
./scripts/git-preflight.sh
```

Do not commit anything that contains a real credential or private key.
