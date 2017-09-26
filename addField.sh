#! /bin/bash
source "./indexUtil.sh"

echo "Environment $environment"
echo "Index name $indexName"
 
buildElasticSearchUrl elasticSearchUrl $environment $indexName
echo $elasticSearchUrl

curl -k --user $username -X PUT $elasticSearchUrl/_mapping/$documentType -d "@$file" | jq ''
