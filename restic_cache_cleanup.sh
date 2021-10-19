#!/bin/bash

echo "-"
echo "-"
echo "Cleaning up restic cache ($(date))..."
echo "---------------------------"

restic cache --cleanup

echo ""
echo "Finished cleaning cache $(date)"
echo "---------------------------"
