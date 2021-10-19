#!/bin/bash

# run unlock script first (includes setting env vars)
. /home/edaly/restic_backup/restic_unlock.sh

echo "-"
echo "-"
echo "Getting backup stats for latest snapshot ($(date))..."
echo "---------------------------"

restic stats --mode restore-size latest
restic stats --mode raw-data latest
