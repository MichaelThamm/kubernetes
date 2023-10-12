#!/bin/bash

docker-tags() {
    arr=("$@")

    for item in "${arr[@]}";
    do
        tokenUri="https://auth.docker.io/token"
        data=("service=registry.docker.io" "scope=repository:$item:pull")
        token="$(curl --silent --get --data-urlencode ${data[0]} --data-urlencode ${data[1]} $tokenUri | jq --raw-output '.token')"
        listUri="https://registry-1.docker.io/v2/$item/tags/list"
        authz="Authorization: Bearer $token"
        result="$(curl --silent --get -H "Accept: application/json" -H "Authorization: Bearer $token" $listUri | jq --raw-output '.')"
        echo $result
    done
}

latest_tag=$(docker-tags "michaelthamm/website" | jq -r '.tags | map(select(test("^v[0-9]+\\.[0-9]+\\.[0-9]+$")) | ltrimstr("v")) | sort | last')
echo "v$latest_tag"