#!/bin/bash

diameter-avp-gen \
	--definitions avp-table.txt \
	--group-definitions ./avp-group-defs/ \
	--write-avp-headers \
	--write-avp-methods \
	--overwrite \
	--directory .
