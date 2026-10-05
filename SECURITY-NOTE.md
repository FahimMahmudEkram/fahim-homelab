# Repository Safety Note

This repository is intentionally separated from the live server state.

Never add:

- real passwords,
- API keys,
- bot tokens,
- access tokens,
- private keys,
- application databases,
- backups,
- personal documents,
- personal photos,
- Tailscale state.

Use local `.env` files or another secret-management method for deployment.

The repository is suitable for scholarship review because it demonstrates the architecture and engineering work without publishing personal runtime data.
