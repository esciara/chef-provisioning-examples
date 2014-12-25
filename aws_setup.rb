require 'chef/provisioning'

# Needs to have the ~/.aws/config set up for it to work
with_driver 'fog:AWS'
with_machine_options :bootstrap_options => { 
  :key_name => 'chefserver'   # Change this to your own key pair
}
