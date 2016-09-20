#!/bin/bash
#
#  name: s3ql_start.sh: 
#  description: Configure s3ql and NFS
#

set -e

#Path for filesystem abstraction

mkdir /ufsa

chown nobody:nogroup /ufsa

chmod 777 /ufsa


#S3Ql over AWS S3 configuration 

#rm /root/.s3ql/authinfo2

mkdir /root/.s3ql

echo "[s3]" >> /root/.s3ql/authinfo2 
echo "storage-url: ${S3_URL}" >> /root/.s3ql/authinfo2
echo "backend-login: ${S3_USER}" >> /root/.s3ql/authinfo2
echo "backend-password: ${S3_PASS}" >> /root/.s3ql/authinfo2
echo "fs-passphrase: ${S3_ENCRYPT}" >> /root/.s3ql/authinfo2

chmod 0600 /root/.s3ql/authinfo2

#fsck.s3ql --authfile /root/.s3ql/authinfo2 ${S3_URL}

mkfs.s3ql --authfile /root/.s3ql/authinfo2 ${S3_URL}

mount.s3ql --authfile /root/.s3ql/authinfo2 ${S3_URL} /ufsa

#NFS 

echo "/ufsa *(rw,sync,insecure,fsid=0,no_subtree_check,no_root_squash)" | tee /etc/exports

rpcbind

/etc/init.d/nfs-kernel-server start


while [ 1 ]; do sleep 1; done
