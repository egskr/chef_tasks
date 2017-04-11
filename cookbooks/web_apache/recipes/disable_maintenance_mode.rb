include_recipe 'web_apache::default'

template "/etc/httpd/conf.d/vhost.conf" do
  source "maint.erb"
end

service 'httpd' do
  action :restart
end


