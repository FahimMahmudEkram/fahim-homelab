# Secrets and private runtime data

This repository intentionally excludes live credentials and runtime state.

Do not commit:
- `.env` files containing real credentials
- API keys, access tokens, Telegram bot tokens, passwords
- Tailscale state or private keys
- Vaultwarden database or RSA keys
- Navidrome/Beszel/Uptime Kuma databases
- Nextcloud/Immich/Paperless application data or databases
- backups and exports
- AdGuard Home's live configuration when it contains credentials

The repository contains example configuration files with placeholder values.
Keep the real values on the server or in a proper secrets manager.
