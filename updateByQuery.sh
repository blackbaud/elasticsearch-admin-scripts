#! /bin/bash
#
# Execute the query in the given query file using Update By Query.
# Documentation here: https://www.elastic.co/guide/en/elasticsearch/reference/5.4/docs-update-by-query.html
# 
# Required args: user, env, index, docType, update
# 
source "./indexUtil.sh"

buildUpdateByQueryUrl elasticSearchUrl $environment $indexName $documentType

echo "elastic search url: $elasticSearchUrl"
echo "updateFile: $updateFile"

curl -k --user $username -X POST $elasticSearchUrl "@$updateFile"

