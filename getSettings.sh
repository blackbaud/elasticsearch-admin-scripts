#! /bin/bash
#
# Get the settings for the given index.
# Required args: user, env, index
#
# Example usage:
# ./getSettings --user "elastic" --env "oscf-dev" --index "lonxt-dev" 
#

source "./indexUtil.sh"

buildElasticSearchUrl elasticSearchUrl $environment $indexName

curl -k --user $username -X GET $elasticSearchUrl/_settings
