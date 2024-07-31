#!/bin/bash
# Script to install Jenkins plugins listed in plugins.txt

JENKINS_PLUGINS_DIR=/usr/share/jenkins/ref/plugins
JENKINS_UC_DOWNLOAD=https://updates.jenkins.io/download/plugins

mkdir -p $JENKINS_PLUGINS_DIR

while IFS=: read -r plugin version; do
    echo "Installing $plugin:$version"
    curl -L -o $JENKINS_PLUGINS_DIR/${plugin}.hpi ${JENKINS_UC_DOWNLOAD}/${plugin}/${version}/${plugin}.hpi
done < /usr/share/jenkins/ref/plugins.txt
