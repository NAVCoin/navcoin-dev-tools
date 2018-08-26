sudo apt-get update
sudo apt-get upgrade -y

sudo apt-get install -y git build-essential libcurl3-dev libtool autotools-dev automake pkg-config libssl-dev libevent-dev bsdmainutils

sudo apt-get install -y libboost-all-dev

sudo apt-get install -y libminiupnpc-dev
sudo apt-get install -y libzmq3-dev 


#install qt5
sudo apt-get install -y libqt5gui5 libqt5core5a libqt5dbus5 qttools5-dev qttools5-dev-tools libprotobuf-dev protobuf-compiler


sudo apt-get install -y libqrencode-dev curl


#install unbound
mkdir tmp
cd tmp
wget https://nlnetlabs.nl/downloads/unbound/unbound-1.7.3.tar.gz
tar xvfz unbound-1.7.3.tar.gz
cd unbound-1.7.3/
./configure
make
make install
cd ..
rm -rf tmp

sudo add-apt-repository ppa:bitcoin/bitcoin
sudo apt-get update
sudo apt-get install -y libdb4.8-dev libdb4.8++-dev

#clone and build all the deps required
git clone https://github.com/NAVCoin/navcoin-core
cd navcoin-core
git checkout master
cd depends
make
cd ..
./autogen.sh
./configure --prefix=`pwd`/depends/x86_64-pc-linux-gnu --enable-debug --enable-tests
make
