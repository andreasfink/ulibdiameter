#!/bin/bash
for DIR in base 3GPP
do
cd $DIR
    ./generate-commands.sh
cd ..
done
