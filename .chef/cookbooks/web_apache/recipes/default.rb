#
# Cookbook:: web_apache
# Recipe:: default
#
# Copyright:: 2017, The Author Yegor, All Rights Reserved.

package 'httpd' do
  action :install
end

template "/var/www/html/maintenance.html" do
  source "maintenance_html.erb"
not_if { ::File.file?("/var/www/html/maintenance.html")}
end
