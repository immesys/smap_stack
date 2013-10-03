#!/usr/bin/env bash
rm -f /var/run/postgresql/.*.lock
rm -f /var/lib/postgresql/9.1/main/postmaster.pid
find /var/lib/postgresql/9.1/ -name "pg_internal.init" -delete
su postgres sh -c "/usr/lib/postgresql/9.1/bin/postgres --config-file=/etc/postgresql/9.1/main/postgresql.conf"
