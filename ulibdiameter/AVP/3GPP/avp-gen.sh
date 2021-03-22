#!/bin/bash

echo diameter-avp-gen --definitions avp-table.txt --group-definitions ./avp-group-defs/ --write-avp-headers --write-avp-methods --overwrite --write-includes  UMDiameterAvp_3GPP_includes.h --write-object-list UMDiameterAvp_3GPP_object_list.inc --directory .  $1

