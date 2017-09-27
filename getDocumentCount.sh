#! /bin/bash
#
# Get a count of the couments on the given index.
# Required args: user, env, index
#

source "./indexUtil.sh"

buildElasticSearchCatUrl elasticSearchCatUrl $environment
curl -k --user $username -X GET $elasticSearchCatUrl/count/$indexName?v
