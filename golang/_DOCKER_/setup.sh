#!/bin/bash

# Setup a new project environment.
echo "[*] Creating Golang project in: $1"
mkdir ../$1
mkdir ../$1/src

echo "[*] Writing build script..."
cat >../$1/build.sh <<EOL
#!/bin/bash
pushd src
/usr/local/go/bin/go build -o myprog
./myprog
/usr/local/go/bin/go clean
EOL

chmod +x ../$1/build.sh

echo "[+] Setup Complete! Your project is in: ../$1"
echo "[+] Pass build.sh to the Docker container to test your work."
