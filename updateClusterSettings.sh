#! /bin/bash
source "./indexUtil.sh"

buildElasticSearchHostName elasticSearchHostName $environment
curl -X PUT $elasticSearchHostName/_cluster/settings -d "@$file" | jq ''
