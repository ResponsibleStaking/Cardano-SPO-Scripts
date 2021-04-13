# Cardano-SPO-Scripts
## pingTipCheck.sh
This script is meant to be run by a cron Job.
It reports the the server is in sync to Healthchecks.io
If no signal goes out Healthchecks.io is triggering an alert.

How to install:
- Create Healthcheck.io Account
- Create a new Check with a 5 minutes period and 1 minute grace time
- Store script on your server (File pingTipCheck)
- Make it executable
```
chmod +x pingTipCheck.sh
```

- Create Crontab Job using "crontab -u user -e"
```
* * * * * /opt/cardano/cnode/custom/pingTipCheck.sh
```
