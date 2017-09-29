#! /bin/bash
#
# Get a count of the documents on the given index.
# Required args: user, env, index
#
# Example usage:
# ./getDocumentCount --user "elastic" --env "oscf-dev" --index "lonxt-dev"
#

source "./indexUtil.sh"

buildElasticSearchCatUrl elasticSearchCatUrl $environment
curl -k --user $username -X GET $elasticSearchCatUrl/count/$indexName?v
