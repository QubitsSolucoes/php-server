echo "Atualizando pacotes do servidor..."
sudo apt-get update

echo "Definindo Senha padrão para o MYSQL e o PHPMYADMIN..."
DEFAULTPASS="root"
sudo debconf-set-selections <<EOF
mysql-server	mysql-server/root_password password $DEFAULTPASS
mysql-server	mysql-server/root_password_again password $DEFAULTPASS
dbconfig-common	dbconfig-common/mysql/app-pass password $DEFAULTPASS
dbconfig-common	dbconfig-common/mysql/admin-pass password $DEFAULTPASS
dbconfig-common	dbconfig-common/password-confirm password $DEFAULTPASS
dbconfig-common	dbconfig-common/app-password-confirm password $DEFAULTPASS
phpmyadmin		phpmyadmin/reconfigure-webserver multiselect apache2
phpmyadmin		phpmyadmin/dbconfig-install boolean true
phpmyadmin      phpmyadmin/app-password-confirm password $DEFAULTPASS 
phpmyadmin      phpmyadmin/mysql/admin-pass     password $DEFAULTPASS
phpmyadmin      phpmyadmin/password-confirm     password $DEFAULTPASS
phpmyadmin      phpmyadmin/setup-password       password $DEFAULTPASS
phpmyadmin      phpmyadmin/mysql/app-pass       password $DEFAULTPASS
EOF

echo "Instalando o basico no servidor linux..."
sudo apt-get install vim curl python-software-properties git-core --assume-yes --force-yes

echo "Adicionando repositorio mais recente do PHP..."
sudo add-apt-repository ppa:ondrej/php -y

echo "Atualizando os pacotes..."
sudo apt-get update

echo "Instalando Mysql"
sudo apt-get install mysql-server mysql-client --assume-yes --force-yes

echo "Instalando o Apache2"
sudo apt-get install apache2 -y

echo "Instalando o PHP 5.6 ..."
sudo apt-get install php5.6 php5.6-mcrypt php5.6-mbstring php5.6-curl php5.6-cli php5.6-mysql php5.6-sqlite php5.6-pgsql php5.6-gd php5.6-imagick php5.6-intl php5.6-xsl php5.6-zip php5.6-xml php5.6-xmlrpc php5.6-redis libapache2-mod-php5.6 -y

echo "Instalando o Redis..."
sudo apt-get install redis-server --assume-yes --force-yes

echo "Instalando o Phpmyadmin..."
sudo apt-get install phpmyadmin php-gettext --assume-yes --force-yes

echo "Desabilitando o php 5"
sudo a2dismod php5

echo "Habilitando o php 5.6"
sudo a2enmod php5.6

echo "Habilitando mod-rewrite do Apache..."
sudo a2enmod rewrite

echo "Baixando o Composer..."
curl -sS https://getcomposer.org/installer | php

echo "Movendo o Composer para o local correto..."
sudo mv composer.phar /usr/local/bin/composer

echo "Instalando o NodeJs..."
sudo apt-get install nodejs -y

echo "Instalando o npm..."
sudo apt-get install npm -y

echo "Atualizando o Node e o NPM para a versão estavel..."
sudo npm install -g n
sudo n stable

echo "Instalando o Gerenciador de pacotes Yarn..."
sudo npm install -g yarn

echo "ServerName localhost" | sudo tee /etc/apache2/conf-available/fqdn.conf
sudo a2enconf fqdn

echo "Reiniciando o servico Apache..."
sudo service apache2 restart

echo "Importando as chaves publicas e criando uma lista de arquivos para o MongoDB..."
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 0C49F3730359A14518585931BC711F9BA15703C6

echo "deb [ arch=amd64 ] http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.4.list

echo "Atualizando os pacotes..."
sudo apt-get update

echo "Instalando o MongoDB..."
sudo apt-get install -y mongodb-org

echo "Iniciando o servico MongoDB..."
sudo service mongod start

echo "Servidor Instalado e Atualizado com Sucesso..."