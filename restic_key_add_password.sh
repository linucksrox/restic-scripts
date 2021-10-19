#!/bin/bash

. /home/edaly/restic_backup/restic_unlock.sh

echo "-"
echo "-"
echo "Adding password"
echo "---------------------------"

restic key add

echo ""
