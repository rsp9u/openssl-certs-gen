#### usage

```
$ ./run.sh <SAN>
```

#### example

```
$ ./run.sh '*.example.com'
$ ls certs/ca.crt certs/cert.crt certs/cert.key
certs/ca.crt  certs/cert.crt  certs/cert.key
```

#### verify

```
$ docker run --rm -d -v $PWD/certs/cert.crt:/cert.crt -v $PWD/certs/cert.key:/cert.key -v $PWD/default.conf:/etc/nginx/conf.d/default.conf -p 443:443 nginx:alpine
```
