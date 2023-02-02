set -evx

apt update
apt install -y --no-install-recommends curl build-essential ca-certificates libxml2

D_COMPLILER="ldc-1.30.0"

wget https://dlang.org/install.sh -O /tmp/install.sh
cd /tmp
chmod +x ./install.sh
./install.sh install ${D_COMPLILER} 

ln -s $(./install.sh get-path ${D_COMPLILER}) /usr/local/bin/ldc2
ln -s $(./install.sh get-path --dmd ${D_COMPLILER}) /usr/local/bin/ldmd2
ln -s $(./install.sh get-path --dub ${D_COMPLILER}) /usr/local/bin/dub

cd ~
dub init main -n
cd main
dub add mir
dub build
rm main source/app.d
