#! /bin/bash
source "./indexUtil.sh"

buildElasticSearchCatUrl elasticSearchCatUrl $environment
echo $elasticSearchCatUrl

curl -k --user $username -X GET $elasticSearchCatUrl/indices?v
