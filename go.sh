#!/bin/bash

TARGET=${TARGETS:="127.0.0.1"}
OPTIONS=${NMAP_OPS:="-v -T4 -F -sV"}
DATE=$(date +%Y-%m-%d-%H-%M-%S)

SLACK_EN=${SLACK_ENABLE:="n"}


cd /data

nmap $OPTIONS $TARGET -oA scan-$DATE > /dev/null

post2slack(){

        if [[ $SLACK_EN == "y" ]];
        then
                if [[ -n "$SLACK_TOKEN" ]] && [[ -n "$SLACK_CHAN" ]];
                then
			curl -F file=@diff-$DATE -F initial_comment="Internal Port Change Detected" -F channels=#$SLACKCHAN -F token=$SLACKTOKEN https://slack.com/api/files.upload
                else
                        echo "[!] Some details for posting to slack are missing"
                fi

        fi

}

if [ -e scan-prev.xml ]; then
    ndiff scan-prev.xml scan-$DATE.xml > diff-$DATE
    [ "$?" -eq "1" ] && sed -i -e 1,3d diff-$DATE && post2slack
fi
ln -sf scan-$DATE.xml scan-prev.xml
