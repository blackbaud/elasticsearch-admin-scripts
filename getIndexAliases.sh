#! /bin/bash
source "./indexUtil.sh"

echo "Environment $environment"

buildElasticSearchUrl elasticSearchUrl $environment $indexName
echo "Elastic search url: $elasticSearchUrl"

curl -X GET $elasticSearchUrl/_alias/*
