# Configuração do Box Vagrant com Ubuntu Server 64 14.04 LTS
Vagrant.configure("2") do |config|
    # Official Ubuntu Server 14.04 LTS (Trusty Tahr) builds
    config.vm.box = "ubuntu/trusty64"
    # Configuracoes da Port do Servidor
    config.vm.network :forwarded_port, guest: 80, host: 8080
    # Ip da maquina 192.168.28.10
    config.vm.network :private_network, ip: "192.168.28.10"
    # Pasta compartilhada /var/www/html para pasta wwww do meu computador + CHMOD 777
    config.vm.synced_folder "www", "/var/www/html", :mount_options => ["dmode=777", "fmode=666"]
    # Pasta compartilhada /etc/apache2/sites-available para pasta vhosts do meu computador + CHMOD 777
    config.vm.synced_folder "vhosts", "/etc/apache2/sites-available", :mount_options => ["dmode=777", "fmode=666"]
    # Configurações da maquina no virtualbox
    config.vm.provider "virtualbox" do |machine|
        # memoria reservada para maquina
    	machine.memory = 1024
    end
    # Arquivo contendo o processo de instalacao e configuração da maquina
    config.vm.provision :shell, path: "install.sh"
end