#! /bin/bash
# 
# Update cluster settings from file.
# Required args: user, env, file
#
# Example usage:
# ./updateClusterSettings --user "elastic" --env "oscf-dev" --file "./settings.json"
#

source "./indexUtil.sh"

buildElasticSearchHostName elasticSearchHostName $environment
curl -k --user $username -X PUT $elasticSearchHostName/_cluster/settings -d "@$file"
