#! /bin/bash
#
# Get all aliases for a given index.
# Required args: user, env, index
#
# Example usage:
# ./getIndexAliases --user "elastic" --env "oscf-dev" --index "lonxt-dev"
#

source "./indexUtil.sh"

echo "Environment $environment"

buildElasticSearchUrl elasticSearchUrl $environment $indexName
echo "Elastic search url: $elasticSearchUrl"

curl -k --user $username -X GET $elasticSearchUrl/_alias/*
