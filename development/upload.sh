#!/bin/bash -ue
package=${1:-$(dirname $0)/../dist/chrome_extension.zip}

GOOGLE_API_ACCESS_TOKEN=$(curl -s https://www.googleapis.com/oauth2/v4/token \
-d client_id=$GOOGLE_API_CLIENT_ID \
-d client_secret=$GOOGLE_API_CLIENT_SECRET \
-d refresh_token=$GOOGLE_API_REFRESH_TOKEN \
-d grant_type=refresh_token | jq --raw-output '.access_token')

curl -v https://www.googleapis.com/upload/chromewebstore/v1.1/items/$CHROME_WEB_STORE_ID \
-H "Authorization: Bearer $GOOGLE_API_ACCESS_TOKEN"  \
-H "x-goog-api-version: 2" \
-X PUT \
-T "${package}"
