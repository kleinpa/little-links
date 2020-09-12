#!/bin/bash -ue
workspace="$(realpath $(dirname "$0")/..)"
src=${1:-$workspace}
dst=${2:-$workspace/dist/stage}
version=${3:-}

rm -rf ${dst}/*

mkdir -p "${dst}/images"
rsvg-convert -a -w 128 -h 128 "${src}/icon.svg" > "${dst}/images/icon128.png"

# Copy files to staging area
ln -sf "${src}/chrome_extension/popup.html" "${dst}/popup.html"
ln -sf "${src}/chrome_extension/popup.js" "${dst}/popup.js"
ln -sf "${src}/chrome_extension/rules.js" "${dst}/rules.js"
ln -sf "${src}/chrome_extension/style.css" "${dst}/style.css"

# Update manifest with build information
if [ ! -z "${version:-}" ]; then
    jq ".version_name = .version | .version = .version + \".${version}\"" "${src}/chrome_extension/manifest.json" > "${dst}/manifest.json"
else
    jq ".version_name = .version + \" dev\"" "${src}/chrome_extension/manifest.json" > "${dst}/manifest.json"
fi

# Generate png images from svg
mkdir -p "${dst}/images"
rsvg-convert -a -w 128 -h 128 "${src}/icon.svg" > "${dst}/images/icon128.png"
