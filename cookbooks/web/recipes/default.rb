#
# Cookbook:: web
# Recipe:: default
#
# Copyright:: 2017, The Author Yegor, All Rights Reserved.

if node.role?("#{node['web_server_type']['nginx']}")
   include_recipe 'web_nginx'
elsif node.role?("#{node['web_server_type']['httpd']}")
   include_recipe 'web_apache'
else 
   puts '####################### No role defined ######################'   
end
