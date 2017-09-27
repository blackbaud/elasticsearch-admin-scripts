#! /bin/bash
#
# Add or change the settings given in file.
# Required args: user, env, index, file
#

source "./indexUtil.sh"

buildElasticSearchHostName elasticSearchUrl $environment $indexName
echo $elasticSearchUrl

curl -k --user $username -X PUT $elasticSearchUrl/_settings -d "@$file"
