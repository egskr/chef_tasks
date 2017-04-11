#
# Cookbook:: tomcat
# Recipe:: default
#
# Copyright:: 2017, The Author, All Rights Reserved.

include_recipe 'java'

package 'tomcat' do
  action :install
end

#package 'tomcat-webapps' do
#  action :install
#end

#template "/etc/tomcat/server.xml" do
#	source "default.erb"
#        mode "0755"
#	variables({
#		"tomcat_port" => node["tomcat"]["tomcat_port"]
#		})
#end


service "tomcat" do
  supports :restart => true, :start => true, :stop => true, :status => false
  action [ :enable, :start ]
end
