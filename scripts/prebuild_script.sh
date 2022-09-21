#!/bin/sh

arch_name="$(uname -m)"
swiftgen_path=""

if [ "$(echo "$arch_name")" = "arm64" ]; then
  swiftgen_path=/opt/homebrew/bin/
fi

if which ${swiftgen_path}swiftgen >/dev/null; then
  ${swiftgen_path}swiftgen
  echo "SwiftGen status: Ok"
else
  echo "warning: swiftgen not installed, download from https://github.com/SwiftGen/SwiftGen"
fi

$(dirname $0)/generate_needle_di.sh
$(dirname $0)/generate_mocks.sh
