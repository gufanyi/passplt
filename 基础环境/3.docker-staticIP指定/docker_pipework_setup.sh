#!/bin/bash

echo 'install git'
yum install git 

echo 'download pipework'
git clone https://github.com/jpetazzo/pipework   

echo 'enter pipework floder'
cd pipework/

echo 'copy pipework to /usr/bin'
cp pipework  /usr/local/bin

chmod +x /usr/local/bin/pipework 

