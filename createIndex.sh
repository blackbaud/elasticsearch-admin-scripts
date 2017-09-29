#! /bin/bash
#
# Create new index with the given name.
# Index schema defined in specified file. Must be valid json.
# Required args: user, env, index, docMappingFile
#
# Example usage:
# ./createIndex.sh --user "elastic" --env "oscf-dev" --index "lonxt-dev" --docMappingFile "./indexMapping.json"
#

source "./indexUtil.sh"

echo "Environment $environment"
echo "Index name $indexName"
echo "Doc mapping file $docMappingFile"

buildElasticSearchUrl elasticSearchUrl $environment $indexName

curl -k --user $username -X POST $elasticSearchUrl -d "@$docMappingFile"
