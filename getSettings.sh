#! /bin/bash
#
# Get the settings for the given index.
# Required args: user, env, index
#

source "./indexUtil.sh"

buildElasticSearchUrl elasticSearchUrl $environment $indexName

curl -k --user $username -X GET $elasticSearchUrl/_settings
