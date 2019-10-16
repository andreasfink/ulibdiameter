#!/bin/bash
for D in base 3GPP draft-ietf-dime-load rfc7683
do
	cd $D
	./avp-gen.sh
	cd ..
done
