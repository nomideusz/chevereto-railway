# Deploy and Host Chevereto on Railway

[![Deploy on Railway](https://railway.com/button.svg)](https://railway.com/new/template/chevereto?utm_medium=integration&utm_source=button&utm_campaign=chevereto)

[Chevereto](https://chevereto.com/) is a self-hosted image and video sharing platform — your own Imgur: drag-and-drop uploads, albums, tags, user accounts, moderation tools, and direct hotlink URLs, running on your own domain with your own rules. This template deploys the free open-source edition (Chevereto V4, AGPLv3).

## About Hosting Chevereto

This template runs Chevereto as two Railway services: the Chevereto app (PHP, listening on port 8080) and MySQL 8. Uploaded media persists on a volume mounted at `/var/www/html/images`; the database lives on its own volume. Upload limits are preconfigured to 2 GB per file. On first visit, Chevereto's built-in installer asks you to create the admin account — no CLI needed.

## Common Use Cases

- Imgur-style community image/video hosting with user accounts and albums
- Personal screenshot/media host with stable direct hotlink URLs
- Private team media library behind registration-off settings

## Dependencies for Chevereto Hosting

- All bundled: MySQL 8 is provisioned by the template

### Deployment Dependencies

- [Chevereto V4 documentation](https://v4-docs.chevereto.com/)
- [Template source on GitHub](https://github.com/nomideusz/chevereto-railway)

### Implementation Details

**Open the `chevereto` service's Railway domain** — the installer runs on first visit and creates your admin account.

Notes and limits:

- The free (AGPL) edition hard-disables a few paid features (custom pages/nav links among them); see the Chevereto docs for the edition comparison.
- Media lives on the `images` volume — volume size is plan-dependent on Railway, so check your plan's cap against your library.
- To send email (password resets, registration), configure SMTP in the admin dashboard after install.
- The API v1 key is per-user, created in the web UI at `/settings/api`.

## Why Deploy Chevereto on Railway?

Railway is a singular platform to deploy your infrastructure stack. Railway will host your infrastructure so you don't have to deal with configuration, while allowing you to vertically and horizontally scale it.

By deploying Chevereto on Railway, you are one step closer to supporting a complete full-stack application with minimal burden. Host your servers, databases, AI agents, and more on Railway.
