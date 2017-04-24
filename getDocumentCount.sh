#! /bin/bash
source "./indexUtil.sh"

buildElasticSearchCatUrl elasticSearchCatUrl $environment
curl -X GET $elasticSearchCatUrl/count/$indexName?v
