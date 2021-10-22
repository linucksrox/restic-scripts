#!/bin/bash

. /home/edaly/restic_backup/restic_env.sh

echo "-"
echo "-"
echo "Initializing new repo"
echo "---------------------------"

restic init

echo ""
echo "Finished initializing $(date)"
echo "---------------------------"
