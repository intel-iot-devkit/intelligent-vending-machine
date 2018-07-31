#!/bin/bash

# partion key - use MAC address
PARTITION_KEY=`cat /sys/class/net/[e]*/address | head -1`
if [ -z "$PARTITION_KEY" ]; then
	PARTITION_KEY=`cat /sys/class/net/[w]*/address | head -1`
fi

if [ -z "$PARTITION_KEY" ] ; then
	echo "Error: Unable to determine partition key"
	exit 1
fi

export PARTITION_KEY="98:4f:ee:05:5d:26"

# credentials
export AZURE_STORAGE_ACCOUNT='iotvendingmachine'
export AZURE_STORAGE_ACCESS_KEY='+bL2CajfZIi0K/DGql0ZGf9vbNWCvkKhVU2l8QlhH9Oprr283DCmrnwUG5MbsRFaBmDk9Q5AwbzkXckOe4KOkQ=='

export HTTP_PROXY=http://proxy-iind.intel.com:911
export HTTPS_PROXY=http://proxy-iind.intel.com:911


node dispense.js
