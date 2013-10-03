#!/usr/bin/env bash

cd /srv/repo
echo "Starting server"
./start_postgres.sh >log 2>&1 &
echo "Delaying"
sleep 5
echo "Server log: "
cat log
echo "Running syncdb"
cd /srv/powerdb2/ && python manage.py syncdb
echo "Server finished, you may want to commit it"

pkill -term postgres
