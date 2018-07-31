#!/bin/sh

#Build Intelligent vending machine webapp

#export HTTP_PROXY=http://proxy-iind.intel.com:911
#export HTTPS_PROXY=http://proxy-iind.intel.com:911
cd ./client
sudo npm install -g bower grunt-cli 
npm install  				
bower install 				
grunt build
cd ../
