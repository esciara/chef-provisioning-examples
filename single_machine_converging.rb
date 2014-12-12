require 'chef/provisioning'

machine 'db' do
  tag 'chef-provisioning-example'

  # Running recipe apt without using "if platform_family?('debian')"
  # as platform_family? will be evaluated on the Chef Provisioning host
  # and not on the machine
  recipe 'apt'

  recipe 'mysql::server'
  converge true
end
