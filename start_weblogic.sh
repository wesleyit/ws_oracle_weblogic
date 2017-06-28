#!/bin/bash
cd "$(dirname $0)"
WORK_DIR="$(pwd)"
DOMAIN_DIR='/u01/oracle/user_projects/domains/base_domain'
[ ! -d "./base_domain" ] && RESET=1

docker rm -f weblogic || true

docker run -d \
	--name weblogic \
	--volume "$WORK_DIR/base_domain":"$DOMAIN_DIR" \
	--publish 7001:7001 \
	wesleyit/oracle_weblogic:latest

if [ "$1" == "reset" -o "$RESET" -eq 1 ]
then
	echo "Waiting 30 seconds (sorry, Oracle is slow...) before reset password..."
	sleep 30
  docker cp ./reset_weblogic_password.sh weblogic:/
	docker exec -ti weblogic bash /reset_weblogic_password.sh
	echo "Password changed. Login using weblogic:p4ssword."
fi
