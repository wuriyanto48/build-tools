#!/bin/sh

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

# installer

check_err()
{
    if [ "$1" -ne "0" ]; then
        echo "Error # ${1} : ${2}"
        exit ${1}
    fi
}

install()
{
    OS=$1
    APP_NAME="MY APP NAME"
    echo "install $APP_NAME ..."

    #check os from args
    case $OS in
        darwin)
            echo "os darwin"
            # TODO
            # wget https://github.com/wuriyanto48/kece/releases/download/v0.0.0/kece-v0.0.0.darwin-amd64.tar.gz
            # tar -zxvf kece-v0.0.0.darwin-amd64.tar.gz
            return 0
            ;;
        linux)
            echo "os linux"
            # TODO
            # wget https://github.com/wuriyanto48/kece/releases/download/v0.0.0/kece-v0.0.0.linux-amd64.tar.gz
            # tar -zxvf kece-v0.0.0.linux-amd64.tar.gz
            return 0
            ;;
        msys)
            echo "os windows"
            #TODO
            return 0
            ;;
        *)
            echo "operating system unknown"
            return 1
            ;;
    esac
    return 0
}

os_type=${OSTYPE//[0-9.-]*/}
check_err $? "os_type returned an error....!"

install $os_type
check_err $? "install returned an error....!"

# TODO
# curl -O https://raw.githubusercontent.com/wuriyanto48/build-tools/master/installer.sh | sh