#! /bin/bash
source "./indexUtil.sh"

buildSearchUrl searchUrl $environment $indexName $documentType
echo "ES search url: $searchUrl"
curl -X GET $searchUrl?scroll=10m -d "@$query" | jq ''
