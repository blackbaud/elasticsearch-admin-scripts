#! /bin/bash
#
# Get the mapping for the specified document type on a given index.
# Required fields: user, env, index, docType
#
# Example usage:
# ./getMappings --user "elastic" --env "oscf-dev" --index "lonxt-dev" --docType "constituent"
#

source "./indexUtil.sh"

echo "Environment $environment"
echo "Index name $indexName"
 
buildElasticSearchUrl elasticSearchUrl $environment $indexName
echo $elasticSearchUrl

curl -k --user $username -X GET $elasticSearchUrl/_mapping/$documentType
