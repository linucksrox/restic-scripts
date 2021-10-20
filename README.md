# restic-scripts
shell scripts for restic to simplify backup/check/restore and other operations and simplify cron scheduling

These are bash scripts designed to be run under Linux, so I offer no support for Windows or Mac based systems although feel free to modify these scripts for your own purposes! I am not opposed to anyone posting issues or pull requests or just comments or questions!

I exclusively run restic with Backblaze B2 and use the B2 API as opposed to the S3 API because when I originally set these up Backblaze did not offer an S3 API. If I could do it again today I would most definitely use the S3 API (but I'm sure it would be fairly trivial to adapt).

The main script is `restic_backup.sh` which you will probably want to schedule with cron. Most other scripts are to make maintenance/troubleshooting tasks easier. You can optionally schedule `restic_check.sh` and `restic_forgetandprune_bypolicy.sh`.

# Getting Started
- Make sure your restic machine has a sufficient amount of RAM and CPU power depending on your backup size and number of files. Also make sure you have enough local filesystem storage for the restic cache (see `RESTIC_CACHE_DIR` below).
- Install restic. I prefer to just download the latest stable binary from Github: [https://github.com/restic/restic/releases/](https://github.com/restic/restic/releases/) but you could also use your distro's package manager
- Clone this repo to the machine you will be using to run restic
- Mount any network directories if you want to back them up (for example a NAS share). I mount mine into the sources directory but they can be anywhere.
  - Update `/etc/fstab` to mount these directories automatically on reboot
- Edit the restic_env.sh file:
  - Update `B2_ACCOUNT_ID`
  - Update `B2_ACCOUNT_KEY`
  - Update `RESTIC_REPOSITORY` (path will be in this format: `b2:your-unique-bucket-name:/`)
  - Update `RESTIC_PASSWORD`
  - Update `RESTIC_INCLUDE_PATHS` based on your system
  - Update `RESTIC_CACHE_DIR` based on where you want to store the cache on your system (I use the cache subdirectory)
- Edit restic_excludefiles.txt and at a minimum remove the example directories that I provide
- Manually run restic_backup.sh to make sure backup is working. I don't know what happens if you are starting a brand new restic repository since this script attempts to unlock the restic repo before running the backup, but if it fails then you would need to manually run restic backup for the first time to create the initial snapshot.

# Scheduling Cron Jobs
- After you verity restic_backup.sh works, you can schedule cron to run the backup periodically.
- I also run restic_check.sh once a week, but due to memory issues I've had in the past, I have a root cron job that reboots the machine 10 minutes before restic_check.sh is scheduled to run. Feel free to modify this schedule based on your needs.
```
# Run restic backup at 6:30 and 18:30 every day
30 6,18 * * * sh /home/user/restic-scripts/restic_backup.sh >> /home/user/restic-scripts/logs/restic_backup.log 2>&1

# Run restic check every Thursday at 14:00 (optionally schedule a system reboot in root's crontab 10 minutes before this runs to free up system resources)
0 14 * * 4 sh /home/user/restic-scripts/restic_check.sh >> /home/user/restic-scripts/logs/restic_backup.log 2>&1
```

Don't forget to monitor the logs periodically and take any necessary action. All the other scripts are meant to be run manually and simplify the maintenance tasks you might need to perform on your restic backup repository.
