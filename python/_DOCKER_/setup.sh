#!/bin/bash

# Setup a new project environment.
echo "[*] Creating Python project in: $1"
mkdir ../$1
mkdir ../$1/src

touch ../$1/requirements.txt
touch ../$1/src/$2

echo "[*] Writing build script..."
echo "[*] TARGET is: $2"
cat >../$1/build.sh <<EOL
#!/bin/bash
pip3 install -r requirements.txt
python3 -u src/$2
EOL

chmod +x ../$1/build.sh

echo "[+] Setup Complete! Your project is in: ../$1"
echo "[+] Pass build.sh to the Docker container to test your work."
