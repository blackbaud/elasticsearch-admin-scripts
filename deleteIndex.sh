#! /bin/bash
source "./indexUtil.sh"

echo "Environment $environment"
echo "Index name $indexName"

buildElasticSearchUrl elasticSearchUrl $environment $indexName 

curl -X DELETE $elasticSearchUrl
