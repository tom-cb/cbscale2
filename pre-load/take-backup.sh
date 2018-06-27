#!/bin/bash


# Take Backup
# Pre Req:
# $DATASET variable set. E.g. travel , retail , etc
# /couchbase dir with plenty of space

mkdir /couchbase/bup

export PATH=$PATH:/opt/couchbase/bin/

cd /couchbase/bup

cbbackupmgr config --archive /couchbase/bup --repo rsCluster

cbbackupmgr list --archive /couchbase/bup

cbbackupmgr backup --archive /couchbase/bup --repo rsCluster --host couchbase://127.0.0.1 --username Administrator --password password

cd /couchbase
tar -zcvf bup.tar.gz ./bup

curl --upload-file bup.tar.gz http://cb-field.s3.amazonaws.com/cbscale2/datasets/$DATASET/


