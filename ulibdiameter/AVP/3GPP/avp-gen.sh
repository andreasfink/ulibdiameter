#!/bin/bash

diameter-avp-gen \
	--definitions avp-table.txt \
	--write-avp-headers \
	--write-avp-methods \
	--overwrite \
	--directory .
