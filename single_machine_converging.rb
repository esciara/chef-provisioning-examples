require 'chef/provisioning'

machine 'db' do
  tag 'chef-provisioning-example'
  if platform_family?('debian')
    recipe 'apt'
  end
  recipe 'mysql::server'
  converge true
end
