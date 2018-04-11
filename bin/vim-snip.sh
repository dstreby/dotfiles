#!/usr/bin/env bash
# Args passed from :TOpaste
# $1 - name
# $2 - tmp file

readonly vs_NAME="${1:?}"
readonly vs_TEMP="${2:?}"
readonly DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cp "$vs_TEMP" "${HOME}/vim-snips/${vs_NAME}" \
  && rm "$vs_TEMP"
