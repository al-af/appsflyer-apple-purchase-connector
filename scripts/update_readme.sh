#!/usr/bin/env bash
set -euo pipefail

VERSION="$1"
README="README.md"

# 1) Update the “built for” table header line
sed -i.bak -E \
  "s|(\|[[:space:]]*iOS[[:space:]]+AppsFlyer SDK )[0-9]+\.[0-9]+\.[0-9]+|\1${VERSION}|" \
  "$README"

# 2) Append a new row under that table’s header 
sed -i.bak -E "/\|[[:space:]]*Platform[[:space:]]*\|[[:space:]]*SDK Version/ a \
| iOS | AppsFlyer SDK ${VERSION} |" \
  "$README"

# 3) Update the Carthage snippet version in the “Adding The Connector…” section
sed -i.bak -E \
  "s|(github\.com/.*/releases/download/)[0-9]+\.[0-9]+\.[0-9]+(/purchase-connector-)(dynamic|static)\.xcframework\.zip|\1${VERSION}\2\3.xcframework.zip|" \
  "$README"

# cleanup backup
rm "${README}.bak"