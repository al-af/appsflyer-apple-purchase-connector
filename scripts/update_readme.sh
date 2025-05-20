#!/usr/bin/env bash
set -euo pipefail

# Usage: scripts/update_readme.sh <version>
VERSION="$1"
README="README.md"

# 1) Update the bolded SDK version in the "Built for" section
#    Matches: iOS AppsFlyer SDK **x.y.z**
sed -i.bak -E \
  "s|(iOS AppsFlyer SDK \*\*)[0-9]+\.[0-9]+\.[0-9]+(\*\*)|\1${VERSION}\2|" \
  "$README"

# Cleanup backup file
rm "${README}.bak"
