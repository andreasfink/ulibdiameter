#!/bin/bash

mkdir -p output
/usr/local/bin/diameter-avp-gen \
	--definitions ../<ulibdiameter/avp-table.txt \
	--write-avp-headers \
	--write-avp-methods \
	--overwrite \
	--directory output
