Vagrant.configure("2") do |config|
  config.vm.define :master do |node|
        node.vm.box = "base"
        node.vm.provider :virtualbox do |vb|
                vb.customize ["modifyvm", :id, "--name", "htchpc"]
                vb.customize ["modifyvm", :id, "--cpus", 2]
        end
	node.vm.provision "shell", path: "script.sh"
  end
end
