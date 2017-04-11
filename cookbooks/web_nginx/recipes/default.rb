#
# Cookbook:: web_nginx
# Recipe:: default
#
# Copyright:: 2017, The Author Yegor, All Rights Reserved.

web 'web_nginx' do 
  action [:install, :setup, :start]
  provider 'web_nginx'
end
