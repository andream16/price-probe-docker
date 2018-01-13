#!/usr/bin/env bash

echo "Dumping PSQL . . ."
sudo -u postgres pg_dump -a -h xx.xxx.xxx.xxx -p xxxx -U postgres -d priceprobe > backup_$(date +"%Y%m%d.%H%M").sql
echo "Dumping Done! Now Removing old docker build . . ."
docker-compose down --rmi all
echo "Build Successfully removed! Starting a new one . . ."
docker-compose up
echo "Build Successfully Started! Now starting PSQL restore . . ."
sudo -u postgres psql -h localhost -p 9042 -U postgres -d priceprobe < backup_$(date +"%Y%m%d.%H%M").sql
echo "PSQL successfully restored!"