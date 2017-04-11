#
# Cookbook:: tomcat
# Recipe:: default
#
# Copyright:: 2017, The Author Yegor, All Rights Reserved.

include_recipe 'java'

package 'tomcat' do
  action :install
end

service "tomcat" do
  supports :restart => true, :start => true, :stop => true, :status => false
  action [ :enable, :start ]
end
