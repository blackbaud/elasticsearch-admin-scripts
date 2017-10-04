#! /bin/bash
#
# Execute the query in the given query file using Update By Query.
# Documentation here: https://www.elastic.co/guide/en/elasticsearch/reference/5.4/docs-update-by-query.html
#
# This script should be used in the case of a long-running task. It will
# kick off the query and return a task, which may be used to check on the 
# status of the query.
#
# This script makes use of Elasticsearch's automatic slicing. Provide a
# positive integer value for this argument to parallelize your task.
# Note: Elasticsearch recommends a multiple of the number of shards on your
# index, with the best performance being the exact number of shards on your
# index.
# 
# Required args: user, env, index, docType, update, slices
# 
# Example usage:
# ./updateByQuery --user "elastic" --env "oscf-dev" --index "lonxt-dev" --docType "constituent" --update "query.json" --slices 5
#

source "./indexUtil.sh"

buildUpdateByQueryUrl elasticSearchUrl $environment $indexName $documentType
elasticSearchUrl="$elasticSearchUrl?wait_for_completion=false";

if [ -z "${slices+''}" ]; then
  echo "You must provide an argument with --slices. Exiting."
  exit -1;
else
  elasticSearchUrl="$elasticSearchUrl&slices=$slices"
fi

echo "elastic search url: $elasticSearchUrl"
echo "updateFile: $updateFile"

curl -k --user $username -X POST "$elasticSearchUrl" "@$updateFile"

