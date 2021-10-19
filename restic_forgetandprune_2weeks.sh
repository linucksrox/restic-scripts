#!/bin/bash

# run unlock script first (includes setting env vars)
. /home/edaly/restic_backup/restic_unlock.sh

echo "-"
echo "-"
echo "Pruning backup keeping only last 14 days ($(date))..."
echo "---------------------------"

restic forget --keep-within 14d --prune

echo ""
echo "Finished pruning $(date)"
echo "---------------------------"
