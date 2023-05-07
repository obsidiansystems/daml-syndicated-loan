#!/nix/store/dzrvibwj2vjwqmc34wk3x1ffsjpp4av7-bash-4.4-p23/bin/bash
# Copyright (c) 2022 Digital Asset (Switzerland) GmbH and/or its affiliates. All rights reserved.
# SPDX-License-Identifier: Apache-2.0

set -euo pipefail

# Create .lib directory
if [[ -d .lib ]]; then
  rm -r .lib
fi
mkdir .lib

# Get the dependency list
echo "Downloading the list of dependencies"
version=$(grep '^version' daml.yaml | cut -d " " -f 2)
curl -L# \
  -H 'Cache-Control: no-cache, no-store' \
  -o .lib/${version}.conf \
  https://raw.githubusercontent.com/digital-asset/daml-finance/main/docs/code-samples/getting-started-config/${version}.conf

# For each dependency, download and install
while IFS=" " read -r url out
do
  printf "Downloading: %s, to: %s\n" "$url" "$out"
  curl -Lf# "${url}" -o ${out}
done < .lib/${version}.conf

echo "All dependencies successfully downloaded!"
