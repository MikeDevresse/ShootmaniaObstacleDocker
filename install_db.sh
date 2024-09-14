#!/bin/bash

# Preparation
SQL_FILE_NAME="install_db.sql"
rm -f ${SQL_FILE_NAME}

echo "Creating SQL script ..."
echo "CREATE DATABASE ${DATABASE_NAME} DEFAULT CHARACTER SET 'utf8mb4' DEFAULT COLLATE 'utf8mb4_unicode_ci';" >> ${SQL_FILE_NAME}
echo "CREATE USER '${USER_NAME}'@'%' IDENTIFIED BY '${USER_PASSWORD}';" >> ${SQL_FILE_NAME}
echo "GRANT ALL PRIVILEGES ON ${DATABASE_NAME}.*  TO '${USER_NAME}'@'%';" >> ${SQL_FILE_NAME}

echo "Executing SQL script as root ..."
mysql -u root --password=secret -h mysql < ${SQL_FILE_NAME}

echo "Cleaning up ..."
rm ${SQL_FILE_NAME}

echo "Done."