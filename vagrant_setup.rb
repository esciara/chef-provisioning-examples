require 'chef/provisioning/vagrant_driver'

with_driver 'vagrant'

vagrant_box 'precise64' do
  url 'http://files.vagrantup.com/precise64.box'
end

with_machine_options :vagrant_options => {
  'vm.box' => 'precise64'
}
