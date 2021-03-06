require 'chef/provisioning'

# Needs to have the ~/.aws/config set up for it to work
with_driver 'fog:AWS'
with_machine_options :bootstrap_options => { 
  :key_name => "#{ENV['AWS_KEYPAIR_NAME']}",
  :flavor_id => 't1.micro',
  #:security_group_ids => "sg-xxxxxxxx" # <= to set if your default SG is not opened for ssh
}
