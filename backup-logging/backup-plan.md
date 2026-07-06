## Linux Backup Script

A basic backup script was created on `GT-LINUX01` to back up the custom GreenTech internal web page files.

Backup target:

- Source folder: `~/greentech-web`
- Backup folder: `~/backups`
- Script location: `~/scripts/backup-greentech-web.sh`
- Backup format: `.tar.gz`

Script actions:

- Creates a timestamped backup filename
- Compresses the `~/greentech-web` folder
- Stores the backup archive in `~/backups`
- Prints success or failure output

Commands used:

```bash
mkdir -p ~/backups
mkdir -p ~/scripts
nano ~/scripts/backup-greentech-web.sh
chmod +x ~/scripts/backup-greentech-web.sh
~/scripts/backup-greentech-web.sh
ls -lh ~/backups
tar -tzf ~/backups/*.tar.gz | head
```

Validation result:

- The backup script ran successfully.
- A timestamped `.tar.gz` backup file was created.
- The backup archive contents were verified using `tar -tzf`.
- The script provides a simple recovery point for the GreenTech internal web page.