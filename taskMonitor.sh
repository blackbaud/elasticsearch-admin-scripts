#! /bin/bash
#
# Queries the _tasks endpoint to watch long running tasks (typically with an update by query)
# Documentation here: https://www.elastic.co/guide/en/elasticsearch/reference/5.5/docs-update-by-query.html#docs-update-by-query-task-api
#
# Required args: user, env
#
# Example usage:
# ./taskMonitor.sh --user "elastic" --env "oscf-dev" --watchSecons 3
#

source "./indexUtil.sh"

buildTasksUrl elasticSearchUrl $environment 

echo "elastic search url: $elasticSearchUrl"

echo -n "Password for $username:"
read -s password

if [ -z "$watch" ]
then
    watch=3
fi

watch -n $watch "curl -# --user '$username:$password' '$elasticSearchUrl/_tasks?detailed=true&actions=*byquery' | python3 taskStatus.py
