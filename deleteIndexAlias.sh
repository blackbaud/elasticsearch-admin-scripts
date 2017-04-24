#! /bin/bash
source "./indexUtil.sh"

echo "Environment $environment"

buildElasticSearchUrl elasticSearchUrl $environment $indexName

curl -X DELETE $elasticSearchUrl/_alias/$alias
