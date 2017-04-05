#! /bin/bash
source "./indexUtil.sh"

echo "Environment $environment"
echo "Index name $indexName"
echo "Doc mapping file $docMappingFile"

buildElasticSearchUrl elasticSearchUrl $environment $indexName

curl -X POST $elasticSearchUrl -d "@$docMappingFile"
