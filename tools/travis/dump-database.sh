#!/bin/bash

# @file tools/travis/dump-database.sh
#
# Copyright (c) 2014-2020 Simon Fraser University
# Copyright (c) 2010-2020 John Willinsky
# Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
#
# Script to dump a copy of the database.
#
# Requires the following environment vars to be set:
# - DBTYPE: Database type (MySQL/MySQLi/PostgreSQL)
# - DBUSERNAME: Database username
# - DBPASSWORD: Database password
# - DBNAME: Database name
# - DBHOST: Database hostname
# - DATABASEDUMP: Path and filename to database dump file

set -xe

# Dump the completed database.
case "$DBTYPE" in
	PostgreSQL)
		pg_dump --clean --username=$DBUSERNAME --host=$DBHOST $DBNAME | gzip -9 > $DATABASEDUMP
		;;
	MySQL|MySQLi)
		mysqldump --user=$DBUSERNAME --password=$DBPASSWORD --host=$DBHOST $DBNAME | gzip -9 > $DATABASEDUMP
		;;
	*)
		echo "Unknown DBTYPE \"${DBTYPE}\"!"
		exit 1
esac
