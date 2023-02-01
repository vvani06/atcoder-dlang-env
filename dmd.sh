set -evx

apt update
apt install -y --no-install-recommends curl build-essential ca-certificates libxml2

D_COMPLILER="dmd-2.101.2"

curl -fsS https://dlang.org/install.sh | bash -s ${D_COMPLILER}
echo source ~/dlang/${D_COMPLILER}/activate >> ~/.bashrc
. ~/dlang/${D_COMPLILER}/activate

dub init main -n && cd main
dub add mir
dub build
rm main source/app.d
