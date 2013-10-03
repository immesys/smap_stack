# This should be sourced
./start_postgres.sh >log 2>&1 &
sleep 2
apt-get install -y readingdb readingdb-python python-smap powerdb2
pushd /etc/apache2/sites-enabled
ln -s ../sites-available/powerdb2 powerdb2
rm 000-default
popd
