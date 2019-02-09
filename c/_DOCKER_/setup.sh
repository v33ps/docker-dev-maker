#!/bin/bash

# Setup a new project environment.
echo "[*] Creating C project in: $1"
mkdir ../$1
mkdir ../$1/src
mkdir ../$1/include

cp Makefile ../$1/Makefile

echo "[*] Writing build script..."
cat >../$1/build.sh <<EOL
#!/bin/bash

make
./myprog
make clean 
EOL

chmod +x ../$1/build.sh

echo "[+] Setup Complete! Your project is in: ../$1"
echo "[+] Pass build.sh to the Docker container to test your work."
