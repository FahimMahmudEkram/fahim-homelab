# Repository layout

This repository contains configuration-as-code for a self-hosted Ubuntu homelab.

The source of truth for infrastructure notes is `README.md`.
Generated runtime state, application databases, backups, and live credentials are deliberately excluded.

Before deployment, replace example hostnames/values and provide secrets through local `.env` files or the deployment mechanism used by each service.
