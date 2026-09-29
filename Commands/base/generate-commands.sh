#!/bin/bash
CMDFILE="UMDiameterCommands_base.inc"
echo "" > $CMDFILE
for F in `cat commands.txt`
do
	echo "COMMAND($F)" >> $CMDFILE
if [ -f "$F_manual.m" ]
then
    echo "Skipping $F because of manual implementation";
else
    diameter-cmd-gen --definition command-def/$F.bnf  --write-command-header $F.h --write-command-method $F.m
fi
done
