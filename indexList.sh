#! /bin/bash
#
# Get a list of indexes on the cluster.
# Required args: user, env
#

source "./indexUtil.sh"

buildElasticSearchCatUrl elasticSearchCatUrl $environment
echo $elasticSearchCatUrl

curl -k --user $username -X GET $elasticSearchCatUrl/indices?v
