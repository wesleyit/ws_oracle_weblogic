#!/bin/bash

## Where is the domain?
export DOMAIN_HOME='/u01/oracle/user_projects/domains/base_domain'

## Stop the domain before exclude the data directory
"$DOMAIN_HOME/bin/stopWebLogic.sh"
rm -rf "$DOMAIN_HOME/servers/AdminServer/data"

## Set the variables and reset the password
source "$DOMAIN_HOME/bin/setDomainEnv.sh"
cd "$DOMAIN_HOME/security"
java weblogic.security.utils.AdminAccount 'weblogic' 'p4ssword' .

## Create an updated boot.properties
cat > "$DOMAIN_HOME/servers/AdminServer/security/boot.properties" <<EOF
password=p4ssword
username=weblogic
EOF

## Get up!
echo "Restarting the domain. It will take more 30 seconds."
nohup "$DOMAIN_HOME/bin/startWebLogic.sh" &
sleep 30
disown

