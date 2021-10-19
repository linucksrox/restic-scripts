#!/bin/bash

. /home/edaly/restic_backup/restic_unlock.sh

echo "-"
echo "-"
echo "Removing password $1"
echo "---------------------------"

restic key remove $1

echo ""
