#! /bin/bash
#
# Run the given aggregation query for the given index and docType. 
# Required args: user, env, index, docType, query
#
# Example usage:
# ./getAggregations --user "elastic" --env "oscf-dev" --index "lonxt-dev" --docType "constituent" --query "aggregationQuery.json"
#

source "./indexUtil.sh"

buildSearchUrl searchUrl $environment $indexName $documentType 

curl -k --user $username -X GET $searchUrl -d "@$query"
