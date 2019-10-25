# file names
ca_key=ca.key
ca_cert=ca.crt
key=cert.key
csr=cert.csr
cert=cert.crt
cnf=$1

# CA
openssl genrsa -out $ca_key 4096
openssl req -x509 -new -nodes -key $ca_key -sha256 -days 3650 -out $ca_cert -subj "/C=JP/ST=Gunma/L=Maebashi/CN=CA"
mkdir -p CA CA/certs CA/crl CA/newcerts CA/private
cp $ca_key CA/private/$ca_key
touch CA/index.txt
echo "01" > CA/crlnumber
echo "01" > CA/serial

# cert
openssl genrsa -out $key 4096
openssl req -new -key $key -out $csr -subj "/C=JP/ST=Gunma/L=Maebashi/CN=Server"
openssl ca -batch -config $cnf -in $csr -keyfile $ca_key -cert $ca_cert -out $cert
rm -f $csr
