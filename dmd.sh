set -evx

sudo apt update
sudo apt install -y --no-install-recommends curl build-essential ca-certificates libxml2

D_COMPLILER="dmd-2.104.0"

wget https://dlang.org/install.sh -O /tmp/install.sh
chmod +x /tmp/install.sh
/tmp/install.sh install ${D_COMPLILER} 

sudo ln -s $(/tmp/install.sh get-path ${D_COMPLILER}) /usr/local/bin/dmd
sudo ln -s $(/tmp/install.sh get-path --dub ${D_COMPLILER}) /usr/local/bin/dub

dub init -n
dub add mir
dub build
rm judge source/app.d
