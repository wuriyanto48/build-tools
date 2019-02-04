#!/bin/bash

# MIT License

# Copyright (c) 2019 Wuriyanto (http://wuriyanto.com)

# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

APP=$1
VERSION=$2

go version
#when something goes wrong with go version, just exit immediately
if [ $? -ne 0 ]; then
    echo 'you need to install go, please visit https://golang.org'
    exit 1
fi

#targets OS, you can add more to this OS collections
#you can add more target, see go_ship_target.md
PLATFORMS=("windows/amd64" "windows/386" "darwin/amd64" "linux/amd64")

if [[ -z "$APP" || -z "$VERSION" ]]; then
    echo "$0 require package name and version arguments"
    echo "example : ./build.sh github.com/Bhinneka/kece/cmd v1.0.0"
    exit 1
fi

#split APP variable
APP_SPLIT=(${APP//\// })

#access app name using 2nd index
APP_NAME=${APP_SPLIT[2]}

for PLATFORM in "${PLATFORMS[@]}"
do
    PLATFORM_SPLIT=(${PLATFORM//\// })
    GOOS=${PLATFORM_SPLIT[0]}
    GOARCH=${PLATFORM_SPLIT[1]}
    OUTPUT_BINARY=$APP_NAME
    if [ $GOOS = "windows" ]; then
        OUTPUT_BINARY+='.exe'
    fi

    env GOOS=$GOOS GOARCH=$GOARCH go build -o $OUTPUT_BINARY $APP
    #when something goes wrong with go build, just exit immediately
    if [ $? -ne 0 ]; then
        echo 'go build fail...'
        exit 1
    fi

    #OUTPUT_TAR_NAME=$APP_NAME'-v0.0.0.'$GOOS'-'$GOARCH'.tar.gz'
    OUTPUT_TAR_NAME=$APP_NAME'-'$VERSION'.'$GOOS'-'$GOARCH'.tar.gz'
    env tar czf $OUTPUT_TAR_NAME $OUTPUT_BINARY
    #when something goes wrong with tar, just exit immediately
    if [ $? -ne 0 ]; then
        echo 'tar process fail...'
        exit 1
    fi
    rm $OUTPUT_BINARY
done

