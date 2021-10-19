#!/bin/bash

# Backblaze B2 credentials
export B2_ACCOUNT_ID=
export B2_ACCOUNT_KEY=

# restic variables
export RESTIC_REPOSITORY=
export RESTIC_PASSWORD=
export RESTIC_INCLUDE_PATHS="/home/user/restic/sources/nas/ /home/user/restic/sources/cloud"
export RESTIC_EXCLUDE_FILE_PATH="/home/user/restic/excludelist.txt"
export RESTIC_CACHE_DIR="/home/user/restic/cache"
export B2_CONNECTIONS=50
