require 'chef/provisioning'

# Needs to have the ~/.aws/config set up for it to work
with_driver 'fog:AWS:esciara'
with_machine_options :bootstrap_options => { 
  :key_name => 'chefserver', 
  :image_id => 'ami-60a10117', 
  :flavor_id => 't2.micro', 
  :vpc_id => 'vpc-6648a303', 
  :subnet_id => 'subnet-0a935c6f' }
