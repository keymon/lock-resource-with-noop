#!/bin/sh
cat > /tmp/input.json
noop=$($(jq -r '(.params.noop // "false")' < /tmp/input.json)
if [ "${noop}" == "true" ]; then
  echo "noop=true. Skipping" 1>&2
  exit 0
fi
/opt/resource/wrapped/pool/in $@ < input.json
