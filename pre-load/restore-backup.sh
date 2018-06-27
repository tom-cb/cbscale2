# Restore
# Pre Req:
# $DATASET variable set. E.g. travel , retail , etc
# /couchbase dir with plenty of space

cd /couchbase

curl -On http://cb-field.s3.amazonaws.com/cbscale2/datasets/$DATASET/bup.tar.gz

tar -zxvf bup.tar.gz


cbbackupmgr list --archive /couchbase/bup

cbbackupmgr restore --archive /couchbase/bup --repo rsCluster --host couchbase://127.0.0.1 --username Administrator --password password


