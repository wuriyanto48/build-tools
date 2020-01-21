#!/bin/sh

check_err()
{
    if [ "$1" -ne "0" ]; then
        echo "Error # ${1} : ${2}"
        exit ${1}
    fi
}

gen()
{
    PACKAGE_NAME=$1
    APP_NAME=$2

    if [[ -z "$PACKAGE_NAME" || -z "$APP_NAME" ]]; then
        echo "$0 require package name and app name arguments"
        return 1
    fi

    mvn archetype:generate -DgroupId=$PACKAGE_NAME -DartifactId=$APP_NAME \
    -DarchetypeArtifactId=maven-archetype-quickstart -DinteractiveMode=false

    return 0
}

gen "$@"
check_err $? "create maven app returned an error....!"


# TODO
# curl https://raw.githubusercontent.com/wuriyanto48/build-tools/master/mvn_create.sh | sh -s com.wuriyanto.cahelek Cahelek