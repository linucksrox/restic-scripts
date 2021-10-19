#!/bin/bash

. /home/edaly/restic_backup/restic_unlock.sh

echo "-"
echo "-"
echo "Changing password"
echo "---------------------------"

restic key passwd

echo ""
