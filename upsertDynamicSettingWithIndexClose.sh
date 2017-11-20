#! /bin/bash
#
# Add or change the settings given in file.
# Required args: user, env, index, file
#
# Example usage:
# ./upsertDynamicSettingWithIndexClose --user "elastic" --env "oscf-dev" --index "lonxt-dev" --file "./settings.json"
#

source "./indexUtil.sh"

buildElasticSearchHostName elasticSearchUrl $environment $indexName
echo $elasticSearchUrl
echo -n "Password for $username:"
read -s password

curl -k --user $username:$password -H'Content-Type: application/json' -X POST $elasticSearchUrl$indexName/_close
curl -k --user $username:$password -H'Content-Type: application/json' -X PUT $elasticSearchUrl$indexName/_settings -d "@$file"
curl -k --user $username:$password -H'Content-Type: application/json' -X POST $elasticSearchUrl$indexName/_open
