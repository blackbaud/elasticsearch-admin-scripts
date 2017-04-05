#! /bin/bash
source "./indexUtil.sh"

buildUpdateByQueryUrl elasticSearchUrl $environment $indexName $documentType

echo "elastic search url: $elasticSearchUrl"
echo "updateFile: $updateFile"

curl -X POST $elasticSearchUrl "@$updateFile"

