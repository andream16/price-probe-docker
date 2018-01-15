#!/usr/bin/env bash

echo "Removing sql file if present . . ."
rm *.sql
echo "Dumping PSQL . . ."
sudo -u postgres pg_dump -a -h localhost -p 9042 -U postgres -d priceprobe > backup_$(date +"%Y%m%d").sql
echo "Dumping Done! Now Removing old docker build . . ."
docker-compose down --rmi all
echo "Build Successfully removed! Starting a new one . . ."
docker-compose up -d
echo "Build Successfully Started!"
