# elasticsearch-admin-scripts

This repo stores the Cerebro team's scripts that make it easier to manage Elasticsearch. Detailed descriptions, including required arguments and example usages, are in the scripts themselves.

## Bash scripts

### indexUtil.sh
Every script makes use of `indexUtil.sh` for argument handling and url building. Possible arguments and examples follow.

### Required args
Every script requires two arguments:
* `env`: the environment of the cluster the script is run against. This is used to build the URL of the cluster the script will be run against. Options are:
  * `local`
  * `oscf-dev`
  * `oscf-stage`
  * `oscf-prod`
* `user`: a user name with access to the cluster in `env`. You will be prompted for the password when the script is run.

### Other arguments

#### `index`
Name of the index the command will run against. You can see what indexes are on your cluster by running `./indexList.sh` for the desired environment.

#### `docType`
The name of the type of document that the command will run against, e.g. `constituent`. You define document types on your index with a name and field mappings. An index may have multiple types.

#### `alias`
The index alias the script will be run against, e.g. `lonxt-current`. You can see what aliases have been created on your cluster with `./getIndexAliases.sh`.

#### `docMappingFile`
The path to a file with the json mapping for a document type. For example:
```json
{
    "settings" : {
        "number_of_shards" : 1
    },
    "mappings" : {
        "type1" : {
            "properties" : {
                "field1" : { "type" : "text" }
            }
        }
    }
}
```

#### `query`
The path to a file containing the body of the search query request that will be made against an index. Note: must be valid json. Example:
```json
{
    "query": {
        "term": { "contact_id": "782cd1a5-a560-4c77-a9ed-904d8d1a582b" }
    }
}
```

#### `update`
The path of a file containing the body of the update request that will be made against an index. Note: must be valid json. Example:
```json
{
    "script": {
        "lang": "painless",
        "file": "delete_individual_gift",
        "params": {
            "gift_id": "1"
        }
    },
    "query": {
        "term": { "contact_id": "783cd1a5-a260-4c67-aaed-904d8d1a582b" }
    }
}
```

#### `file`
The path of a file containing some json used to add or update some aspect of the cluster or index. Script-dependent.

#### `slices`
A positive integer value indicating the number of slices Elasticsearch should use in an update by query. Note: this is only applicable to the `updateByQueryLongRunning` script. Note also that Elasticsearch suggests using a multiple of the number of shards on the index, with the best performance seen using the exact number of shards on the index.

## Prettifying output
Output of the scripts being run is in unformatted json. We highly recommend you install and use `jq`.

## Task monitoring script
We have a handy dandy little python script to report out Elasticsearch task info, which is most useful like so:
```bash
watch -n 3 "curl -# --user 'elastic:PASSWORD' 'http://es-master.oscf-prod.blackbaudcloud.com:9200/_tasks?detailed=true&actions=*reindex' | python3 taskStatus.py
```
where `-n 3` is the watch's update interval in seconds. Note that `PASSWORD` needs to change.

