#!/bin/sh

arch_name="$(uname -m)"
parent_path=""

if [ "$(echo "$arch_name")" = "arm64" ]; then
  parent_path=/opt/homebrew/bin/
fi

if which ${parent_path}swiftformat >/dev/null; then
  ${parent_path}swiftformat .
else
  echo "warning: SwiftFormat not installed, download from https://github.com/nicklockwood/SwiftFormat"
fi

if which ${parent_path}swiftlint >/dev/null; then
  ${parent_path}swiftlint --config ./../.swiftlint.yml
else
  echo "warning: SwiftLint not installed, download from https://github.com/realm/SwiftLint"
fi
