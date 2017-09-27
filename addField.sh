#! /bin/bash
#
# Add a new field to an existing index.
# Field mapping is defined in specified file. Must be valid json.
# Required args: user, env, index, docType, file
#

source "./indexUtil.sh"

echo "Environment $environment"
echo "Index name $indexName"
 
buildElasticSearchUrl elasticSearchUrl $environment $indexName
echo $elasticSearchUrl

curl -k --user $username -X PUT $elasticSearchUrl/_mapping/$documentType -d "@$file"
