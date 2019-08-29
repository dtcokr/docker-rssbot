#!/bin/sh
if [ $# -ne 0 ]
then
    rssbot $DF $TK $1
else
    rssbot $DF $TK
fi
