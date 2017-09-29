#! /bin/bash
#
# Delete existing index with the specified name.
# Required args: user, env, index
#
# Example usage:
# ./deleteIndex --user "elastic" --env "oscf-dev" --index "lonxt-v1"
#

source "./indexUtil.sh"

echo "Environment $environment"
echo "Index name $indexName"

buildElasticSearchUrl elasticSearchUrl $environment $indexName 

curl -k --user $username -X DELETE $elasticSearchUrl
