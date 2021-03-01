#!/bin/bash

diameter-avp-gen \
	--definitions avp-table.txt \
	--group-definitions ./avp-group-defs/ \
	--write-avp-headers \
	--write-avp-methods \
	--overwrite \
    --write-includes  UMDiameterAvp_fts_includes.h \
    --write-object-list UMDiameterAvp_fts_list.inc \
	--directory . --verbose
