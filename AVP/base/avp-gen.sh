#!/bin/bash

diameter-avp-gen \
	--definitions avp-table.txt \
	--group-definitions ./avp-group-defs/ \
	--write-avp-headers \
	--write-avp-methods \
	--overwrite \
    --write-includes  UMDiameterAvp_base_includes.h \
    --write-object-list UMDiameterAvp_base_object_list.inc \
	--directory . --verbose
