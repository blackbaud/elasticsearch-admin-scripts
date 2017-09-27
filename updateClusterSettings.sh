#! /bin/bash
# 
# Update cluster settings from file.
# Required args: user, env, file
#

source "./indexUtil.sh"

buildElasticSearchHostName elasticSearchHostName $environment
curl -k --user $username -X PUT $elasticSearchHostName/_cluster/settings -d "@$file"
