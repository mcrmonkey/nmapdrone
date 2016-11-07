# NMAP Drone

Based on a script released by Jerry Gamblin [here](https://twitter.com/JGamblin/status/795041780014137345)

This runs an nmap scan on a list of targets and saves the results.

Subsequent scans will be compared with the last scan and if desired can be posted to slack

## Data

The script is set to save its data to `/data`.
If you're running the script outside of the docker container you'll either need to change this in the script or create that directory


## Targets

For saftey the script's default target is localhost ( 127.0.0.1 )

You can either change the script or run it like so

```
TARGETS="192.168.0.1" go.sh
```

If you're using the docker image append the following option to your docker command:

```
-e TARGETS="192.168.0.1"
```

## Posting to Slack

You'll need:
* to setup your own bot on slack so you can get an API token pass it to the variable: `SLACK_TOKEN`
* A channel to post in. Pass it to the variable `SLACK_CHAN`
* To enable the slack posting option. pass it the variable `SLACK_ENABLE`

you can run it direct with the following 

```
SLACK_ENABLE="Y" SLACK_CHAN="channel" SLACK_TOKEN="xxxx" go.sh
```

Or via docker with the following options set:

```
-e SLACK_ENABLE="Y" -e SLACK_CHAN="channel" -e SLACK_TOKEN="xxxx"
```


# Running with docker

Run the container with the following command:

```
docker run -v /path/to/data:/data:rw -e SLACK_ENABLE="Y" -e SLACK_CHAN="channel" -e SLACK_TOKEN="xxxx" -e TARGETS="192.168.0.1" mcrmonkey/nmapdrone
```

* `-v /path/to/data:/data:rw` - If you want to preserve your scan data. `/path/to/data` is the path to the directory on your host where you want to save the data

* `-e xxxx` - These set envionment variables


# Credit

The original script was written by Jerry Gamblin ( @JGamblin on twitter and github ) and has been adapted by ant to work in a docker container

# Licence

I've not applied one.

You can do what ever you like to this version. However, I'd ask you link back here if you make something based on this.


