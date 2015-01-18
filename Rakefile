# Used template made available on http://www.neverstopbuilding.com/setting-up-a-chef-build-system
task :default => [:list]

desc "Lists all the tasks."
task :list do
  puts "Tasks: \n- #{(Rake::Task.tasks).join("\n- ")}"
end

desc "Uploads cookbooks to the chef-zero server."
task :upload do
  puts "Vendoring cookbooks to 'cookbooks/'."
  sh "bundle exec berks vendor cookbooks"
end

desc "Fires up the simplest_machine recipe on Vagrant using chef-zero."
task :vagrant_simplest do
  puts "Converging simplest_machine.rb using chef-zero."
  sh "bundle exec chef-client -z vagrant_setup.rb simplest_machine.rb"
end

desc "Fires up the single_machine_converging recipe on Vagrant using chef-zero."
task :vagrant_single do
  Rake::Task["upload"].invoke

  puts "Converging single_machine_converging.rb using chef-zero."
  sh "bundle exec chef-client -z vagrant_setup.rb single_machine_converging.rb"
end

desc "Destroys all stuff created on Vagrant using chef-zero."
task :vagrant_destroy do
  puts "Converging simplest_machine.rb using chef-zero."
  sh "bundle exec chef-client -z vagrant_setup.rb destroy_all.rb"
end

desc "Fires up the simplest_machine recipe on AWS using chef-zero."
task :aws_simplest do
  puts "Converging simplest_machine.rb using chef-zero."
  sh "bundle exec chef-client -z aws_setup.rb simplest_machine.rb"
end

desc "Fires up the single_machine_converging recipe on AWS using chef-zero."
task :aws_single do
  Rake::Task["upload"].invoke

  puts "Converging single_machine_converging.rb using chef-zero."
  sh "bundle exec chef-client -z aws_setup.rb single_machine_converging.rb"
end

desc "Destroys all stuff created on AWS using chef-zero."
task :aws_destroy do
  puts "Converging simplest_machine.rb using chef-zero."
  sh "bundle exec chef-client -z aws_setup.rb destroy_all.rb"
end
