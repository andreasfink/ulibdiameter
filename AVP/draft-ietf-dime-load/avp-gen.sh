#!/bin/bash

diameter-avp-gen \
	--definitions avp-table.txt \
	--group-definitions ./avp-group-defs/ \
	--write-avp-headers \
	--write-avp-methods \
	--overwrite \
    --write-includes  UMDiameterAvp_draft_ietf_dime_load_includes.h \
    --write-object-list UMDiameterAvp_draft_ietf_dime_load_object_list.inc \
	--directory . --verbose
