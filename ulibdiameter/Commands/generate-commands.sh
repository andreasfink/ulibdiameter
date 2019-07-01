#!/bin/bash
for F in `cat all-commands.txt`
if [ -f "$F_manual.m" ]
then
    echo "Skipping $F because of manual implementation";
else
    diameter-command-gen --definition $F.bnf  --write-command-header $F.h --write-command-method $F.m
fi

