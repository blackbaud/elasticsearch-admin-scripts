# elasticsearch-admin-scripts

This repo stores the Cerebro team's scripts that make it easier to manage Elasticsearch. Detailed descriptions are in the scripts themselves.

## Example usage
```bash
./createIndex.sh --user "username" --env "local" --index "myIndex" --docMappingFile "document_mapping.json"
```

Every script requires two arguments:
* `env`: the environment of the cluster the script is run against (e.g. `oscf-dev`)
* `user`: a user name with access to the cluster in `env`

Each script has its own further required arguments listed in its description.

## indexUtils.sh
Every script makes use of `indexUtils.sh` for argument handling and url building.

## Prettifying output
Output of the scripts being run is in unformatted json. We highly recommend you install and use `jq`.

