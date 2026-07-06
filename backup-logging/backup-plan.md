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

## Linux Logging and Monitoring

Basic logging and monitoring checks were performed on `GT-LINUX01`.

The purpose of this step was to validate that the Linux server can be monitored using built-in Linux tools and Docker logs.

Monitoring areas:

- System uptime
- Disk usage
- Memory usage
- SSH service logs
- Docker container logs
- Firewall status

Commands used:

```bash
hostname
uptime
df -h
free -h
sudo journalctl -u ssh --no-pager | tail -20
docker logs greentech-nginx --tail 20
sudo ufw status verbose
```

Monitoring checks:

- `uptime` was used to verify that the server was running.
- `df -h` was used to check disk usage.
- `free -h` was used to check memory usage.
- `journalctl` was used to review SSH service logs.
- `docker logs` was used to review logs from the `greentech-nginx` container.
- `ufw status verbose` was used to confirm firewall status and allowed ports.

Result:

- The Linux server was successfully monitored using standard command-line tools.
- SSH logs were available through `journalctl`.
- Docker container logs were available through `docker logs`.
- Firewall status confirmed that SSH and port `8080/tcp` were allowed.
- These checks provide a basic operational monitoring approach for the GreenTech lab environment.


## Backup Restore Test

A restore test was performed to validate that the GreenTech web page backup could be recovered successfully.

Restore test objective:

- Confirm that the `.tar.gz` backup archive can be extracted.
- Confirm that the backed up `index.html` file exists after restore.
- Compare the restored file with the original file.
- Validate that the backup can be used as a recovery point.

Commands used:

```bash
ls -lh ~/backups
mkdir -p ~/restore-test
LATEST_BACKUP=$(ls -t ~/backups/greentech-web-backup-*.tar.gz | head -1)
echo $LATEST_BACKUP
tar -xzf "$LATEST_BACKUP" -C ~/restore-test
find ~/restore-test -type f
diff ~/greentech-web/index.html ~/restore-test/home/garus/greentech-web/index.html
if diff ~/greentech-web/index.html ~/restore-test/home/garus/greentech-web/index.html > /dev/null; then
  echo "Restore validation successful: restored index.html matches the original file."
else
  echo "Restore validation failed: restored file differs from original."
fi
```

Validation result:

- The latest GreenTech web backup archive was identified.
- The backup archive was extracted into a restore test directory.
- The restored `index.html` file was located successfully.
- The restored file was compared with the original file.
- The restore validation completed successfully.

Result:

The backup process was validated by performing a restore test. This confirmed that the backup archive can be used to recover the GreenTech internal web page files.