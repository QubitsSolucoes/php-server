Ambiente de Desenvolvimento para Php e Javascript
===========

Servidor Ubuntu Server 14.04 64 Bits com Php 5.6

Configuração do Vagrant

###Pacotes Inclusos:

- Ubuntu 14.04 LTS (Trusty Tahr)
- PHP 5.6
- MySQL 5.5
- PostgreSQL
- SQlite
- MongoDB
- Vim
- Git
- cURL
- GD e Imagick
- PhpMyAdmin 
- Composer
- Node
- NPM
- Yarn
- Redis


Você vai precisar: 
==============

- Virtualbox - https://www.virtualbox.org/wiki/Downloads
- Vagrant - https://www.vagrantup.com/downloads.html
- Git Bash - https://git-for-windows.github.io/
- Acesso Internet


-> Instale o Virtualbox e o Vagrant de acordo com seu sistema operacional.


Modo de Uso
===========

* Clone esse repositório para sua máquina:

- git clone https://github.com/studioatual/php-server.git ( Execute o comando no seu Prompt/Terminal )

* Inicie a máquina virtual com o comando:

- vagrant up 


Após este comando 'vagrant up', o Vagrant ficará responsavel por baixar o sistema operacional, configurar a máquina virtual no VirtualBox e posteriormente baixar, instalar e configurar todos os pacotes do script 'install.sh'. 

O processo na primeira vez é demorado, então deixe o computador processando e vai tomar um cafezinho.

Quando tudo estiver pronto, um servidor web estará disponível no endereço http://192.168.28.10, e a instalação do PHPMyAdmin em http://192.168.28.10/phpmyadmin, para acessar utilize:

- Login: root
- Senha: root


Coloque seu código no diretório "www".

Para acessar o linux da maquina virtual via bash digite o comando:

- vagrant ssh

Para sair do linux na maquina virtual, digite o comando:

- exit

Para desligar a máquina virtual utilize o comando:

- vagrant halt

Para religar novamente utilize:

- vagrant up

Caso queira destruir a máquina virtual (o conteúdo do www não será excluido):

- vagrant destroy
