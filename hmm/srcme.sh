monit
sleep 3
cd /srv/powerdb2
python manage.py syncdb
echo "Done"
