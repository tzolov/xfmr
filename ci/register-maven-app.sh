#!/usr/bin/env sh

set -e -u

cd xfmr

THE_VERSION=$(grep -o '<revision[^"]*' pom.xml | sed -e 's/<revision>\(.*\)<\/revision>/\1/')

echo "Registering xfmr ${THE_VERSION}"

curl \
	-X \
	POST "http://sabby-test-dataflow-server.cfapps.io/apps/processor/xfmr?force=true" \
    -d "uri=maven://com.example:xfmr:${THE_VERSION}"