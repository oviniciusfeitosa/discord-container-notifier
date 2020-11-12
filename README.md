
# Discord container notifier

Notify at Discord channel when docker containers is down.

## How to use

### Create your `config.sh` file.

  ```sh
  cp config.sh.example config.sh
  ```

### Edit the `config.sh`

  ```sh
  url='https://discord.com/api/webhooks/99999999999999999999/______very_crazy_hash______'
  username='MyBotName'
  listOfContainers="mycontainer1 mycontainer2"
  ```

### Start the script

  ```sh
  ./start.sh
  ```

### Work with task scheduling

To work with a schedule to execute this script you can set following below.

- Set the env `DISCORD_CONTAINER_NOTIFIER_DIR` globally to current dir

```sh
sudo sh -c "echo \"DISCORD_CONTAINER_NOTIFIER_DIR=$(pwd)\" >> /etc/environment"
```

- Add scheduled job

```sh
crontab -e

  */5 * * * * sh -c "$DISCORD_CONTAINER_NOTIFIER_DIR/start.sh"
```

### Monitor job schedule logs

```sh
grep CRON /var/log/syslog

# or

tail -f /var/log/syslog | grep CRON
```

## References

- [Crontab Guru](https://crontab.guru)