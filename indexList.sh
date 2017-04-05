#! /bin/bash
source "./indexUtil.sh"

buildElasticSearchCatUrl elasticSearchCatUrl $environment
echo $elasticSearchCatUrl

curl -X GET $elasticSearchCatUrl/indices?v


