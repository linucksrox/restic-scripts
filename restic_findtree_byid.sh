#!/bin/bash

# run unlock script first (includes setting env vars)
. /home/edaly/restic_backup/restic_unlock.sh

echo "-"
echo "-"
echo "Finding tree with id: $1 ($(date))..."
echo "---------------------------"

restic find --tree $1

echo ""
echo "Finished finding tree $(date)"
echo "---------------------------"
