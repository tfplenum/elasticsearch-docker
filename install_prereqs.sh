PYTHON_VSN='3.6.5'

yum install -y yum-utils
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo curl -L https://github.com/docker/compose/releases/download/1.21.0/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
yum install -y zlib-devel openssl-devel docker-ce gcc

wget -P ./install https://www.python.org/ftp/python/${PYTHON_VSN}/Python-${PYTHON_VSN}.tgz

tar xf ./install/Python-${PYTHON_VSN}.tgz -C ./install

CURRENT_DIR=$pwd

cd ./Python-${PYTHON_VSN}

./configure

make

make install

cd ${CURRENT_DIR}

pip3 install --upgrade pip
pip3 install virtualenv jinja2 jinja2-cli flake8 requests retrying testinfra pytest pyfiglet
