#! /bin/bash
#
# Add a new field to an existing index.
# Field mapping is defined in specified file. Must be valid json.
# Required args: user, env, index, docType, file
#
# Example usage:
# ./addField --user "elastic" --env "oscf-dev" --index "lonxt-dev" --docType "constituent" --file "./field1.json"
#

source "./indexUtil.sh"

echo "Environment $environment"
echo "Index name $indexName"
 
buildElasticSearchUrl elasticSearchUrl $environment $indexName
echo $elasticSearchUrl

curl -k --user $username -X PUT $elasticSearchUrl/_mapping/$documentType -d "@$file"
