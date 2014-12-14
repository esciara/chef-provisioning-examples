require 'chef/provisioning'

# machine 'managed-db' do
#   tag 'chef-provisioning-example'
# 
#   recipe 'apt'
#   recipe 'mysql::server'
#   converge true
# end
# 
machine 'phpmyadnmin' do
  tag 'chef-provisioning-example'
  recipe 'phpmyadmin' 

  attributes(
    :phpmyadmin => {
      :fpm => false
    }
  )
end
