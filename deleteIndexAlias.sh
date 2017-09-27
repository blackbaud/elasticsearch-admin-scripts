#! /bin/bash
#
# Delete alias with the specified name for the given index.
# Required args: user, env, index, alias
#

source "./indexUtil.sh"

echo "Environment $environment"

buildElasticSearchUrl elasticSearchUrl $environment $indexName

curl -k --user $username -X DELETE $elasticSearchUrl/_alias/$alias
