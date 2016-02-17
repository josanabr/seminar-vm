Vagrant.configure("2") do |config|
  config.vm.define :htchpc do |node|
        node.vm.box = "ubuntu/trusty64"
        node.vm.provider :virtualbox do |vb|
                vb.customize ["modifyvm", :id, "--name", "htchpc"]
                vb.customize ["modifyvm", :id, "--cpus", 2]
        end
	node.vm.provision "shell", path: "script.sh"
  end
end
