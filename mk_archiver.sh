#!/usr/bin/env bash
echo "Starting server"
./start_postgres.sh >log 2>&1 &
echo "Delaying"
sleep 5
echo "Server log: "
cat log
echo "Starting config script"
echo "----"
su postgres -c psql <<EOF
CREATE USER archiver WITH PASSWORD 'password';
CREATE DATABASE archiver WITH OWNER archiver;
EOF

su postgres -c "psql archiver" <<EOF
CREATE EXTENSION hstore;
EOF

pkill -term postgres
sleep 2
