#!/usr/bin/env bash
# Business App Kit: one-command install on a fresh Ubuntu 22.04 or 24.04 server (any VPS).
#
#   curl -fsSL https://raw.githubusercontent.com/Pushpraj1989/business-app-kit/main/install.sh | sudo DOMAIN=order.example.com bash
#
# DOMAIN is the web address for your business; its DNS A record must point to this server first.
# No domain yet? DOMAIN=ip uses a free address made from the server's IP, like 203-0-113-10.sslip.io.
# It installs the customer website, the admin console and the customer web app (/app/), with HTTPS, the database and
# everything they need. WITH_APP=0 skips the web app (it downloads the Flutter SDK, about 2 GB, and takes longer).
# Optional: LE_EMAIL=you@example.com for certificate expiry notices. Safe to run again.
set -euo pipefail

REPO_URL="${REPO_URL:-https://github.com/Pushpraj1989/business-app-kit.git}"
BRANCH="${BRANCH:-main}"

[ "$(id -u)" = 0 ] || { echo "Run as root: ... | sudo DOMAIN=order.example.com bash" >&2; exit 1; }
if [ -z "${DOMAIN:-}" ]; then
  echo "Set DOMAIN, for example:  curl -fsSL .../install.sh | sudo DOMAIN=order.example.com bash" >&2
  echo "No domain yet? Use DOMAIN=ip for a free address made from this server's IP." >&2
  exit 1
fi
. /etc/os-release 2>/dev/null || true
if [ "${ID:-}" != ubuntu ]; then
  echo "This installer is made for Ubuntu 22.04 or 24.04 (this server is ${PRETTY_NAME:-unknown})." >&2
  exit 1
fi

command -v git >/dev/null || { apt-get update -y >/dev/null; apt-get install -y git >/dev/null; }
src="$(mktemp -d)"
trap 'rm -rf "$src"' EXIT
git clone --quiet --depth 1 --branch "$BRANCH" "$REPO_URL" "$src/code"

REPO_URL="$REPO_URL" BRANCH="$BRANCH" DOMAIN="$DOMAIN" WITH_APP="${WITH_APP:-1}" LE_EMAIL="${LE_EMAIL:-}" \
  bash "$src/code/food-app/deploy/setup.sh"
