
# Cookbook:: deploy
# Recipe:: default
#
# Copyright:: 2017, The Author Yegor, All Rights Reserved.

remote_file node[:deploy][:zip_app] do
  source node[:deploy][:app_url]
  action :create_if_missing
end

package 'unzip' do
  action :install
end

execute 'unarchive_app' do
  command "unzip -j #{node[:deploy][:zip_app]} -d #{node[:deploy][:tmp_app_dir]}"
  not_if { ::File.directory? ("#{node[:deploy][:tmp_app_dir]}") }
end


remote_file "#{node['tomcat']['tomcat_apps_folder']}/#{node['deploy']['web_app_name']}" do
  source "file://#{node[:deploy][:tmp_app_dir]}/#{node['deploy']['web_app_name']}"
end

#execute 'change owner for app' do
#  command "chown -R #{node[:jboss][:user]}:#{node[:jboss][:group]} #{node[:jboss][:jboss_home]}/standalone/deployments/testweb/"
#end
