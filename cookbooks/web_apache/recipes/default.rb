#
# Cookbook:: web_apache
# Recipe:: default
#
# Copyright:: 2017, The Author Yegor, All Rights Reserved.

web 'web_apache' do 
  action [:install, :setup, :start]
  provider 'web_apache'
end
