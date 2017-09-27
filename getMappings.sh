#! /bin/bash
#
# Get the mapping for the given index and document type.
# Required fields: user, env, index, docType
#

source "./indexUtil.sh"

echo "Environment $environment"
echo "Index name $indexName"
 
buildElasticSearchUrl elasticSearchUrl $environment $indexName
echo $elasticSearchUrl

curl -k --user $username -X GET $elasticSearchUrl/_mapping/$documentType
