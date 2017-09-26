#! /bin/bash
source "./indexUtil.sh"

echo "Environment $environment"

buildElasticSearchUrl elasticSearchUrl $environment $indexName
echo "Elastic search url: $elasticSearchUrl"

curl -k --user $username -X GET $elasticSearchUrl/_alias/*
