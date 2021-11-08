# Generate the private key
openssl genrsa -out xyz.key 2048

# Extract the public key
openssl rsa -in xyz.key -pubout -out xyz-pub.key
  