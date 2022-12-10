#!/bin/bash
DIR=`date +%d-%m-%y`
DEST=~/mongo_db_backup_folder/$DIR
mkdir -p $DEST
mongodump -u username -p password -h localhost:27017 -o $DEST

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
sudo apt install unzip
unzip awscliv2.zip
sudo ./aws/install

/usr/local/bin/aws s3 sync ~/$DEST s3://my-bucket-name-for-mongo-backup