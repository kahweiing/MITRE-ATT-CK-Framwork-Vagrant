Vagrant.configure("2") do |config|
  config.vm.network "public_network"
  config.vm.box = "hashicorp/bionic64"
  config.vm.provider "virtualbox" do |v|
        v.memory = 6144
    end
  config.vm.provision "shell", path: "setup.sh"
  config.vm.provision :docker
  config.vm.provision :docker_compose, yml: "/vagrant/docker-compose.yml", rebuild: true, run: "always"
end