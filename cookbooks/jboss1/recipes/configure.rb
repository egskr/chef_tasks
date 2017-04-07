execute 'change ownership to jboss user' do
  user 'root'
  command "chown -R #{node[:jboss][:user]}:#{node[:jboss][:group]} #{node[:jboss][:jboss_home]}"
end

directory '/etc/jboss-as/' do
  action :create
end

template "/etc/jboss-as/jboss-as.conf" do
  source "jboss_conf.erb"
  owner 'root'
  group 'root'
  variables({
     :jboss_user => node[:jboss][:user],
  })
end

template "/etc/init.d/jboss" do
  source "jboss.erb"
  owner 'root'
  group 'root'
  mode '0755'
  variables({
     :jboss_home => node[:jboss][:jboss_home],
  })
end

service 'jboss' do
  action :start
end
