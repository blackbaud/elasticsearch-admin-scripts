#! /bin/bash
#
# Create new index alias associated with the specified index.
# Required args: user, env, index, alias
#
# Example usage:
# ./createIndexAlias.sh --user "elastic" --env "oscf-dev" --index "lonxt-dev" --alias "lonxt-dev-current"
#

source "./indexUtil.sh"

echo "Environment $environment"

buildElasticSearchUrl elasticSearchUrl $environment $indexName

curl -k --user $username -X PUT $elasticSearchUrl/_alias/$alias
