#!/bin/bash -ue
workspace="$(realpath $(dirname "$0")/..)"

# Configure temporary staging
staging="$(mktemp -d)"
clean() {
    rm -rf "${staging}"
}
trap clean exit
echo using temp "${staging}"

. "${workspace}/development/stage.sh" "${workspace}" "${staging}" "${GITHUB_RUN_NUMBER:-}"

mkdir -p "${workspace}/dist"
( cd ${staging}; zip -r "${workspace}/dist/chrome_extension.zip" * )
