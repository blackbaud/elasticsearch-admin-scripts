#! /bin/bash
#
# Create new index alias associated with the specified index.
# Required args: user, env, index, alias
#

source "./indexUtil.sh"

echo "Environment $environment"

buildElasticSearchUrl elasticSearchUrl $environment $indexName

curl -k --user $username -X PUT $elasticSearchUrl/_alias/$alias
