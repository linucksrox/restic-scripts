#!/bin/bash

# make Go garbage collector very aggresive in order to try to prevent out of memory issues
export GOGC=20

# run unlock script first (includes setting env vars)
. /home/edaly/restic_backup/restic_unlock.sh

echo "-"
echo "-"
echo "Checking backup ($(date))..."
echo "---------------------------"

restic check --cache-dir "${RESTIC_CACHE_DIR}" --cleanup-cache

echo ""
echo "Finished checking backup $(date)"
echo "---------------------------"
df -h
