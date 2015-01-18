require 'chef/provisioning/vagrant_driver'

with_driver 'vagrant'

vagrant_box 'precise64' do
  url 'http://files.vagrantup.com/precise64.box'
end

with_machine_options :vagrant_config  => <<-ENDCONFIG
config.vm.box = "precise64"
config.vm.provider "virtualbox" do |v|
  v.memory = 1024
  v.cpus = 2
end
ENDCONFIG
