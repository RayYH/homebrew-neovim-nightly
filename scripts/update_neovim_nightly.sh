#!/usr/bin/env bash
set -euo pipefail

TEMPLATE="tmpl/neovim-nightly.rb"
OUTPUT="Casks/neovim-nightly.rb"

# --- helpers ---------------------------------------------------------------
api() {
  # Use GITHUB_TOKEN if available to avoid rate limits
  if [[ -n "${GITHUB_TOKEN:-}" ]]; then
    curl -fsSL -H "Authorization: Bearer $GITHUB_TOKEN" -H "Accept: application/vnd.github+json" "$1"
  else
    curl -fsSL -H "Accept: application/vnd.github+json" "$1"
  fi
}

sha256_of() {
  if command -v sha256sum >/dev/null 2>&1; then
    sha256sum "$1" | awk '{print $1}'
  else
    shasum -a 256 "$1" | awk '{print $1}'
  fi
}

require() {
  command -v "$1" >/dev/null 2>&1 || { echo "Missing dependency: $1"; exit 1; }
}

# --- checks ----------------------------------------------------------------
require jq
require curl

[[ -f "$TEMPLATE" ]] || { echo "Template not found: $TEMPLATE"; exit 1; }

# --- fetch nightly assets ---------------------------------------------------
json="$(api https://api.github.com/repos/neovim/neovim/releases/tags/nightly)"

arm_url=$(echo "$json" | jq -r '.assets[] | select(.name | test("nvim-macos-arm64\\.tar\\.gz$")) | .browser_download_url')
intel_url=$(echo "$json" | jq -r '.assets[] | select(.name | test("nvim-macos-x86_64\\.tar\\.gz$")) | .browser_download_url')

if [[ -z "$arm_url" || -z "$intel_url" || "$arm_url" == "null" || "$intel_url" == "null" ]]; then
  echo "Could not locate both macOS nightly assets."
  exit 1
fi

# --- download + compute sha -------------------------------------------------
tmpdir="$(mktemp -d)"
trap 'rm -rf "$tmpdir"' EXIT

arm_tgz="$tmpdir/nvim-arm64.tgz"
intel_tgz="$tmpdir/nvim-x86_64.tgz"

curl -fL "$arm_url"   -o "$arm_tgz"
curl -fL "$intel_url" -o "$intel_tgz"

arm_sha="$(sha256_of "$arm_tgz")"
intel_sha="$(sha256_of "$intel_tgz")"

echo "ARM64 sha256 : $arm_sha"
echo "x86_64 sha256: $intel_sha"

# --- render from template ---------------------------------------------------
rendered="$tmpdir/neovim-nightly.rb"
# Use Perl for portable in-place templating
perl -pe "s/__ARM_SHA256__/$arm_sha/g; s/__INTEL_SHA256__/$intel_sha/g" "$TEMPLATE" > "$rendered"

mkdir -p "$(dirname "$OUTPUT")"

# Only overwrite if content changed
if [[ -f "$OUTPUT" ]] && diff -q "$rendered" "$OUTPUT" >/dev/null; then
  echo "No changes in Cask; already up to date."
  exit 0
fi

cp "$rendered" "$OUTPUT"
echo "Updated $OUTPUT"