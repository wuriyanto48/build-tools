#!/bin/sh

# MIT License

# Copyright (c) 2020 Wuriyanto (http://wuriyanto.com)

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

# Golang installation script for linux
# Usage:
# curl -s https://raw.githubusercontent.com/wuriyanto48/build-tools/master/go_download_linux.sh | sh

check_err()
{
    if [ "$1" -ne "0" ]; then
        echo "Error # ${1} : ${2}"
        exit ${1}
    fi
}

echo download go..

# change version you want
curl -O https://dl.google.com/go/go1.20.linux-amd64.tar.gz

echo verify archive..
sha256sum go1.20.linux-amd64.tar.gz
check_err $? "sha256sum returned an error....!"

echo extract archive..
tar -xvf go1.20.linux-amd64.tar.gz
check_err $? "tar returned an error....!"

sudo chown -R root:root ./go
check_err $? "chown returned an error....!"

sudo mv go /usr/local
check_err $? "mv returned an error....!"

echo remove archive..
sleep 1
rm go1.20.linux-amd64.tar.gz
check_err $? "rm archive returned an error....!"

# after above process, add new env variables to .profile or .bash_profile
# open .profile
# vi ~/.profile
# add this line
# export GOPATH=$HOME/go
# export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin

# Macos add this line
# export GOPATH=/Users/johndoe/Documents/go-work
# export GOROOT=/usr/local/go
# export PATH=$PATH:$GOROOT/bin

# and then load the commands into the current shell instance
# source ~/.profile

# change go version

# remove current go version installed on your machine
# $ which go
# $ /usr/local/go/bin/go
# $ cd /usr/local/
# $ sudo rm -rf go/

# and re run this script
