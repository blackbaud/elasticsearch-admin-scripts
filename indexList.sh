#! /bin/bash
source "./indexUtil.sh"

buildElasticSearchCatUrl elasticSearchCatUrl $environment
echo $elasticSearchCatUrl

echo $username
echo $password
curl -k --user $username -X GET $elasticSearchCatUrl/indices?v
