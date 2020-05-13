#!/bin/sh

THING="/workspace/endpoints/corp.json" #stores cache on boot drive
#THING="/workspace/endpointsCacheOnExternal/corp.json" #stores cache on attached drive perms error

SITEFILE="${JENKINS_HOME}${THING}"

if [ ! -f "$SITEFILE" ]; then
	echo "$SITEFILE file missing"
    exit 1
fi

/usr/local/bin/autopkg run --post 'io.github.hjuutilainen.VirusTotalAnalyzer/VirusTotalAnalyzer' \
"$JENKINS_HOME/workspace/apps/AdobeCreativeCloudInstaller.multi.jss.recipe" \
"$JENKINS_HOME/workspace/apps/Slack.multi.jss.recipe" \
"$JENKINS_HOME/workspace/apps/Chrome.multi.jss.recipe" \
"$JENKINS_HOME/workspace/apps/Firefox.multi.jss.recipe" \
"$JENKINS_HOME/workspace/apps/Zoom.multi.jss.recipe" \
--prefs "$SITEFILE" -vv \
#--key STOP_IF_NO_JSS_UPLOAD=False

echo "finished run: $(date)"


