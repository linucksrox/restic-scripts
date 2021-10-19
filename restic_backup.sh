#!/bin/bash

# run unlock script first (includes setting env vars)
. /home/edaly/restic_backup/restic_unlock.sh

echo "-"
echo "-"
echo "Running scheduled backup ($(date))..."
echo "---------------------------"

restic backup $RESTIC_INCLUDE_PATHS --exclude-file=$RESTIC_EXCLUDE_FILE_PATH -o b2.connections=$B2_CONNECTIONS

echo ""
echo "Finished scheduled backup $(date)"
echo "---------------------------"
