#! /bin/bash
source "./indexUtil.sh"

buildElasticSearchUrl elasticSearchUrl $environment $indexName
echo $elasticSearchUrl

curl -X PUT $elasticSearchUrl/_settings -d "@$file" | jq ''
