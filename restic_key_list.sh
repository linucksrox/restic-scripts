#!/bin/bash

. /home/edaly/restic_backup/restic_unlock.sh

echo "-"
echo "-"
echo "Listing current keys"
echo "---------------------------"

restic key list

echo ""
