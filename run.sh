#!/bin/sh
mkdir -p certs
docker run --rm -ti -v $PWD/create.sh:/create.sh -v $PWD/openssl.cnf:/openssl.cnf -v $PWD/certs:/certs -w /certs alpine sh -c "
  apk add openssl &&
  /create.sh /openssl.cnf
"
