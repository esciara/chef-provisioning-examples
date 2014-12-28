[![Stories in Ready](https://badge.waffle.io/esciara/chef-provisioning-examples.png?label=ready&title=Ready)](https://waffle.io/esciara/chef-provisioning-examples)
chef-provisioning-examples
==========================

Set of examples to start gradually with [Chef Provisioning](https://github.com/opscode/chef-provisioning)

## Requirements

* Ruby installed (tested with version 2.1.5)
* ChefDK installed (tested with version 0.3.5)
* Vagrant installed (tested with version 1.6.5)
* VirtualBox installed (tested with version 4.3.10)

This was all tested (Vagrant and AWS setups) on OS X Yosemite (10.10.1). I also tested the AWS setup from an Ubuntu precise64 vm using Vagrant on my mac.

## Setup for AWS usage

**Note**: AWS might not work at the present because of default security groups issues. see [Launch the examples with AWS setup](#launch-the-examples-with-aws-setup) section.

### AWS credentials

Added AWS credentials in `~/.aws` as per http://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html#cli-config-files but putting everything in the `~/.aws/config` file.

In my case :

```
[default]
region = eu-west-1a
aws_access_key_id=your_key
aws_secret_access_key=your_other_key
```

For more info, Chef doc at https://github.com/opscode/chef-provisioning/blob/master/docs/blogs/2012-05-22-new-driver-interface.html.markdown#using-metal-today-aws)

### AWS private Key

All the info available in the Chef doc at https://github.com/opscode/chef-provisioning/blob/master/docs/blogs/2012-05-22-new-driver-interface.html.markdown#using-metal-today-aws

I add `my_aws_key.pem` in `~/.chef/keys/`

## Before you can launch the examples

### Get the cookbooks with Berkshelf

This is done with:

`$ berks install && berks vendor cookbooks`

### Set the Key Pair to your own

This is done by putting your own key pair name in the `:key_name` option in the `aws_setup.rb` file.

## Launch the examples with Vagrant setup 

This is done with (pick your choice, and if there are new recipes not mentioned here, well use them by copying the examples below!!!):

```
$ chef-client -z vagrant_setup.rb simplest_machine.rb
$ chef-client -z vagrant_setup.rb single_machine_converging.rb
$ chef-client -z vagrant_setup.rb whatever_new_recipe.rb
```

You destroy all created machines with:

```
$ chef-client -z vagrant_setup.rb destroy_all.rb
```

## Launch the examples with AWS setup 

**Note**: AWS might not work at the present because of default security groups issues. This is because port 22 for SSH is closed in the default security group, and therefore Chef Provisioning cannot connect to it once it is created. Three potential workarounds that need to be tested:

* Manually open by default port 22 on the default security group => bad hack... Will mean port 22 is opened to every future instance created on AWS (manually or automatically).
* Manually create a VPC with a security group for that VPC that opens port 22 and then change the `aws_setup.rb` to use it for the maching => a bit safer if you use this VPC only for your tests purposes.
* Create automatically the VPC and the security group using [AWS SDK for Ruby](http://aws.amazon.com/fr/sdk-for-ruby/) or [Chef Provisioning AWS driver](https://github.com/opscode/chef-provisioning-aws) => rocks but probably too complicated for this set of examples.

Same as for the Vagrant setup but by replacing `vagrant_setup.rb` with `aws_setup.rb`.

For instance:

```
$ chef-client -z aws_setup.rb simplest_machine.rb
$ chef-client -z aws_setup.rb destroy_all.rb
```

## TO DO

* Explain what happened: 
  * `nodes` directory created
  * `clients` directory created
  * `local-mode-cache` and `vms` directories created in `.chef/` (and not `~/.chef/` since we are using the `.chef/knife.rb` file)
* Explain why using a `.chef/knife.rb` file where it could be skipped