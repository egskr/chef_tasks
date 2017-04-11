#
# Cookbook:: deploy
# Recipe:: default
#
# Copyright:: 2017, The Author Yegor, All Rights Reserved.

remote_file node[:deploy][:zip_app] do
  source node[:deploy][:app_url]
  owner node[:jboss][:user]
  group node[:jboss][:group]
  action :create_if_missing
end

package 'unzip' do
  action :install
end

execute 'unarchive_app' do
  command "unzip #{node[:deploy][:zip_app]} -d #{node[:jboss][:jboss_home]}/standalone/deployments/"
  not_if { ::File.directory? ("#{node[:jboss][:jboss_home]}/standalone/deployments/hudson/") }
end

execute 'change owner for app' do
  command "chown -R #{node[:jboss][:user]}:#{node[:jboss][:group]} #{node[:jboss][:jboss_home]}/standalone/deployments/"
end

data = data_bag_item( 'my_databag', 'hudson' )

template "#{node[:jboss][:jboss_home]}/standalone/deployments/hudson/hudson.xml" do
  source "hudson.erb"
  variables( engine: data[node.chef_environment]['engine'] )
  action :create
  notifies :restart, 'service[jboss]', :immediately
end 
