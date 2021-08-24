# -*- mode: ruby -*-
# vi: set ft=ruby :

box = "ubuntu/focal64"

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  config.vm.box = box

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # NOTE: This will enable public access to the opened port
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access
  # via 127.0.0.1 to disable public access
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  # config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "1024"
  # end
  #
  # View the documentation for the provider you are using for more
  # information on available options.
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "2048"
  end

  # Enable provisioning with a shell script. Additional provisioners such as
  # Ansible, Chef, Docker, Puppet and Salt are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   apt-get update
  #   apt-get install -y apache2
  # SHELL

  config.vm.provision "shell", inline: <<-SHELL
    set -e
    export DEBIAN_FRONTEND=noninteractive
    apt-get update
    apt-get install -y --no-install-recommends ansible curl git

    GITDIR="/tmp/isucon11-qualify"
    rm -rf ${GITDIR}
    git clone --depth=1 https://github.com/isucon/isucon11-qualify.git ${GITDIR}
    (
      cd ${GITDIR}/provisioning/ansible
      # common
      sed -i -e '/timezone/d' roles/common/tasks/main.yml
      sed -i -e '/name.*Deploy/,/dest/d' -e 's/^$/    recurse: yes/' roles/common/tasks/isucon11-qualify.yml

      # bench
      curl -sL https://github.com/isucon/isucon11-qualify/releases/download/public/initialize.json > roles/bench/files/initialize.json
      sed -i -e '/InsecureSkipVerify/s/=.*/= true/' ../../bench/main.go
      sed -i -e 's/tls\.Config{}/tls.Config{InsecureSkipVerify: true}/' -e '/ServerName:/a			InsecureSkipVerify: true,' ../../bench/scenario/posting.go

      # contestant
      curl -sL https://github.com/isucon/isucon11-qualify/releases/download/public/1_InitData.sql > roles/contestant/files/initial-data.sql
      openssl x509 -in <(openssl req -subj '/CN=*.t.isucon.dev' -nodes -newkey rsa:2048 -keyout roles/contestant/files/etc/nginx/certificates/tls-key.pem) -req -signkey roles/contestant/files/etc/nginx/certificates/tls-key.pem -sha256 -days 3650 -out roles/contestant/files/etc/nginx/certificates/tls-cert.pem -extfile <(echo -e "basicConstraints=critical,CA:true,pathlen:0\nsubjectAltName=DNS.1:*.t.isucon.dev")
      mkdir -p /var/lib/cloud/scripts/per-instance
      sed -i -e '/^index=/s/=.*/=1/' roles/contestant/files/var/lib/cloud/scripts/per-instance/generate-env_aws.sh
      sed -i -e 's/192\.168\.0/127.0.0/' roles/contestant/files/etc/hosts

      ansible-playbook -i standalone.hosts --connection=local site.yml
      /var/lib/cloud/scripts/per-instance/generate-env.sh
    )
    rm -rf ${GITDIR}

    apt-get remove -y --purge ansible
    apt-get autoremove -y
  SHELL
end
