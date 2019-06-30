#!/bin/bash

mkdir -p output
/Library/Application\ Support/FinkTelecomServices/bin/diameter-avp-gen \
	--definitions ../ulibdiameter/AVP/avp-table.txt \
	--write-avp-headers \
	--write-avp-methods \
	--overwrite \
	--directory output
