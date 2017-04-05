#! /bin/bash
source "./indexUtil.sh"

buildSearchUrl searchUrl $environment $indexName $documentType

curl -X GET $searchUrl -d "@$query" | jq ''
