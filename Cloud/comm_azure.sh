#!/bin/bash

# parse command line
if [ -z "$1" -o ! -f "$1" ]; then
	echo "Usage: $0 <sqlite3_events_file>"
	exit 1
fi

export SQLITE3_EVENTS_FILE=$1

# partition key - use MAC address
PARTITION_KEY=`cat /sys/class/net/[e]*/address | head -1`
if [ -z "$PARTITION_KEY" ]; then
	PARTITION_KEY=`cat /sys/class/net/[w]*/address | head -1`
fi

if [ -z "$PARTITION_KEY" ] ; then
	echo "Error: Unable to determine partition key"
	exit 1
fi


# credentials
export AZURE_STORAGE_ACCOUNT='iotvendingmachine'
export AZURE_STORAGE_ACCESS_KEY='+bL2CajfZIi0K/DGql0ZGf9vbNWCvkKhVU2l8QlhH9Oprr283DCmrnwUG5MbsRFaBmDk9Q5AwbzkXckOe4KOkQ=='

export HTTP_PROXY=http://proxy-iind.intel.com:911
export HTTPS_PROXY=http://proxy-iind.intel.com:911


node comm_azure.js
