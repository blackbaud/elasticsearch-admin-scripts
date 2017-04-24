#! /bin/bash
source "./indexUtil.sh"

buildElasticSearchUrl elasticSearchUrl $environment $indexName

curl -X GET $elasticSearchUrl/_settings | jq ''
