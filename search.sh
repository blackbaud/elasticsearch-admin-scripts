#! /bin/bash
#
# Execute given search query against index of given name.
# Required args: user, env, index, docType
#

source "./indexUtil.sh"

buildSearchUrl searchUrl $environment $indexName $documentType

curl -k --user $username -X GET $searchUrl -d "@$query"
