#! /bin/bash
#
# Get a list of indexes on the cluster.
# Required args: user, env
#
# Example usage:
# ./indexList --user "elastic" --env "oscf-dev"
#

source "./indexUtil.sh"

buildElasticSearchCatUrl elasticSearchCatUrl $environment
echo $elasticSearchCatUrl

curl -k --user $username -X GET $elasticSearchCatUrl/indices?v
