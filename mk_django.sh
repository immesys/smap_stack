#!/usr/bin/env bash
echo "Starting server"
./start_postgres.sh >log 2>&1 &
echo "Delaying"
sleep 5
echo "Server log: "
cat log
echo "Starting django script"
echo "----"

cd /srv/powerdb2
python manage.py syncdb --noinput
python manage.py createsuperuser --noinput --username root --email smapstack@steelcode.com
#python django-admin.py changepassword --noinput --username root foobar
echo "Done"
pkill -term postgres
sleep 2
