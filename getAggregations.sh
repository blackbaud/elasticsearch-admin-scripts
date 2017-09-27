#! /bin/bash
#
# Run the given aggregation query for the given index and docType. 
# Required args: user, env, index, docType, query
#

source "./indexUtil.sh"

buildSearchUrl searchUrl $environment $indexName $documentType 

curl -k --user $username -X GET $searchUrl -d "@$query"
