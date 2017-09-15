#!/bin/bash
bold=$(tput bold)
normal=$(tput sgr0)

declare -a backup_urls=('https://c66-managed-storage.s3.amazonaws.com/a6438406348efdccaf07580d90579384/backups/f3e65df9edad6603f34a68933bbc4d1f/postgresql/wHbJgoQgrT/2017.09.15.12.19.56/postgresql.tar.gz?AWSAccessKeyId=AKIAJKSRCRWYBP7M6MYQ&Expires=1505492713&Signature=vb8Hc60koMidrKS%2FNmTErIk55Wg%3D');
declare -a backup_files=(postgresql.tar.gz);

echo "${bold}This script will download backup with id 11516959 of stack Production Service Alliance [Prod] and prepare it to restore${normal}"
echo "${bold}This is a Postgresql backup containing ${#backup_urls[@]} part(s)${normal}"

echo "${bold}Do you want to start?${normal}"
select yn in "Yes" "No"; do
    case $yn in
        Yes )  break;;
        No ) exit;;
    esac
done

echo "${bold}Download started! ($(date '+%d/%m/%Y %H:%M:%S'))${normal}"
echo ""

counter=0
while [ $counter -lt ${#backup_urls[@]} ]
do
  echo "${bold}Downloading $PWD/${backup_files[counter]} ($(date '+%d/%m/%Y %H:%M:%S'))${normal}"
  echo ""
  curl -o "${backup_files[counter]}" "${backup_urls[counter]}"
  echo ""
  counter=$(( $counter + 1 ))
done


if [ ${#backup_files[@]} -gt 1 ]
then
  echo "${bold}Concatenating multi parts together ($(date '+%d/%m/%Y %H:%M:%S'))${normal}"
  echo ""
  cat ${backup_files[@]} > c66_backup_11516959.tar
else
  mv  ${backup_files[0]} c66_backup_11516959.tar
fi

echo "${bold}Download is finished ($(date '+%d/%m/%Y %H:%M:%S'))${normal}"
echo "${bold}The download result is $PWD/c66_backup_11516959.tar${normal}"
echo ""

echo "${bold}Creating a temp folder to unzip the result $PWD/UunnrDgAUnfAymCXpPHS ${normal}"
echo ""
mkdir  UunnrDgAUnfAymCXpPHS

echo "${bold}Untaring the result into $PWD/UunnrDgAUnfAymCXpPHS ($(date '+%d/%m/%Y %H:%M:%S'))${normal}"
echo ""
tar -xvf c66_backup_11516959.tar -C UunnrDgAUnfAymCXpPHS

if [ -n "$(find UunnrDgAUnfAymCXpPHS '(' -name '*.sql' -o -name '*.sql.gz' ')' -type f)" ]
then
  find UunnrDgAUnfAymCXpPHS -type f -exec mv -i {} UunnrDgAUnfAymCXpPHS \;
  data_files=($(find UunnrDgAUnfAymCXpPHS '(' -name '*.sql' -o -name '*.sql.gz' ')' -type f -exec basename {} ';'))
  data_file=${data_files[0]}
  if [[ $data_file == *.gz ]]
  then
    echo "${bold}Unzipping the result ($(date '+%d/%m/%Y %H:%M:%S'))${normal}"
    echo ""
    gzip -d UunnrDgAUnfAymCXpPHS/$data_file
    data_file=${data_file%.gz}
  fi
  echo ""
  echo "${bold}Datafile is ready: $PWD/UunnrDgAUnfAymCXpPHS/$data_file ($(date '+%d/%m/%Y %H:%M:%S'))${normal}"
  echo "${bold}1. In order to be able to use bellow scripts you need to set <DB Name> and <DB App Username> as environment variables. You can find the values in Cloud66 Dashboard Postgresql server detail page${normal}"
  echo "    export PG_DATABASE_NAME=<DB Name>"
  echo "    export PG_APP_USERNAME=<DB App Username>"
  echo "${bold}2. You need to clear old data from your database before restore.${normal}"
  echo "${bold}    2.1 To stop all the activities on your db you can use this command :${normal} sudo -u postgres psql -c \"SELECT pg_terminate_backend(pg_stat_activity.pid) FROM pg_stat_activity WHERE pg_stat_activity.datname = '\$PG_DATABASE_NAME' AND pg_stat_activity.pid <> pg_backend_pid();\""
  echo "${bold}    2.2 To drop the whole database you can use this command :${normal} sudo -u postgres psql -c \"DROP DATABASE IF EXISTS \$PG_DATABASE_NAME\""
  echo "${bold}    2.3 To create a new database you can use this command:${normal} sudo -u postgres psql -c \"CREATE DATABASE \$PG_DATABASE_NAME WITH encoding 'unicode'\" "
  echo "${bold}    2.4 if you are using postgis, you need to add its extensions after database creation. Use following commands to install postgis extensions ${normal}"
  echo "        sudo -u postgres psql -d \$PG_DATABASE_NAME -c \"CREATE EXTENSION postgis;\" "
  echo "        sudo -u postgres psql -d \$PG_DATABASE_NAME -c \"CREATE EXTENSION postgis_topology;\" "
  echo "        sudo -u postgres psql -d \$PG_DATABASE_NAME -c \"CREATE EXTENSION fuzzystrmatch;\" "
  echo "        sudo -u postgres psql -d \$PG_DATABASE_NAME -c \"CREATE EXTENSION postgis_tiger_geocoder;\" "
  echo "${bold}3. You can use following command to restore your db.${normal}"
  echo "psql -U \$PG_APP_USERNAME --no-password \$PG_DATABASE_NAME <  $PWD/UunnrDgAUnfAymCXpPHS/$data_file"
else
  backup_folders=($(find UunnrDgAUnfAymCXpPHS -name raw -type d))
  backup_folder=${backup_folders[0]}
  if [ -n "$backup_folder" ]
  then
    echo ""
    echo "${bold}Data folder is ready: $PWD/$backup_folder ($(date '+%d/%m/%Y %H:%M:%S'))${normal}"
    echo "${bold}Follow these steps to restore:${normal}"
    echo "${bold}1.Stop Postgresql service${normal}"
    echo "${bold}    If you are running on Ubuntu 12.04 or 14.04:${normal} (sudo -u postgres pg_ctl stop -D /usr/local/pgsql/data -m f -t 10 || true) && sudo stop postgresql"
    echo "${bold}    If you are running on Ubuntu 16.04 :${normal} sudo systemctl stop postgresql"
    echo "${bold}2.Delete Postgresql data directory :${normal} sudo rm -rf /usr/local/pgsql/data"
    echo "${bold}3.Create a blank Postgresql data directory :${normal} sudo mkdir -p /usr/local/pgsql/data"
    echo "${bold}4.Copy $PWD/$backup_folder to Postgresql data directory :${normal} sudo cp -a $PWD/$backup_folder/. /usr/local/pgsql/data/"
    echo "${bold}5.Fix the permission of Postgresql data directory :${normal} sudo chown -R postgres:postgres /usr/local/pgsql/data"
    echo "${bold}6.Fix the access right of Postgresql data directory :${normal} sudo chmod -R 0700 /usr/local/pgsql/data"
    echo "${bold}7.Start Postgresql service${normal}"
    echo "${bold}    If you are running on Ubuntu 12.04 :${normal} sudo /etc/init.d/postgresql start"
    echo "${bold}    If you are running on Ubuntu 14.04 :${normal} sudo service postgresql start"
    echo "${bold}    If you are running on Ubuntu 16.04 :${normal} sudo systemctl start  postgresql"
  else
    echo ""
    echo "${bold}Couldn't find a postgresql compatible data folder in $PWD/UunnrDgAUnfAymCXpPHS${normal}"
  fi
  echo "For more information take a look at this page http://help.cloud66.com/database-management/database-backup"
fi



