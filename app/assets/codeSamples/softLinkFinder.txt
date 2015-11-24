#!/bin/csh
#AUTHOR:     Brian Durbin
#NAME:          Brian's AWESOME script of AMAZINGNESS +5.
#DATE DUE:  10-29-15
#DESCRIPTION:       Searches for soft-links
#
#EXIT VALUES
#                       0        file does not exist
#                      10        incorrect number of arguments
#                      20


if ($#argv != 1) then
	echo "You need 1 argument."
        exit 10
        
    endif

if (( ! -f "$argv[1]" )) then
	echo "$argv[1] is not a file";
	exit 20
	endif




ls -l | grep ^l | grep "\-> $argv[1]"






