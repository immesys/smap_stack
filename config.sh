service monit start
sleep 4
cd /srv/powerdb2/
python manage.py changepassword root
echo -e "\nRoot password set"

