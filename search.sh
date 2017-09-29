#! /bin/bash
#
# Execute given search query against index of given name.
# Required args: user, env, index, docType, query
#
# Example usage:
# ./search --user "elastic" --env "oscf-dev" --index "lonxt-dev" --docType "constituent" --query "search.json"
#

source "./indexUtil.sh"

buildSearchUrl searchUrl $environment $indexName $documentType

curl -k --user $username -X GET $searchUrl -d "@$query"
