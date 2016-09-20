#!/bin/bash
#
#  name: s3ql_start.sh: 
#  description: Configure s3ql and NFS
#

set -e

docker-compose -f ufsa-compose.yml up -d --no-build ufsa
