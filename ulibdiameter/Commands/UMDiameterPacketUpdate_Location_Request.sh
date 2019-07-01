#!/bin/bash
F=UMDiameterPacketUpdate_Location_Request

diameter-gen --definition $F.bnf  --write-command-header $F.h --write-command-method $F.m
