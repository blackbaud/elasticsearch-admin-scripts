#! /bin/bash
source "./indexUtil.sh"

echo "Environment $environment"

buildElasticSearchUrl elasticSearchUrl $environment $indexName

curl -X PUT $elasticSearchUrl/_alias/$alias
