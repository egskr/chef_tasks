# Actions for jboss application erver installation

group node[:jboss][:group] do
  action :create
end

user node[:jboss][:user] do
  group node[:jboss][:group]
  manage_home true
  action :create 
end

remote_file node[:jboss][:zip_file] do
  source node[:jboss][:download_url]
  owner node[:jboss][:user]
  group node[:jboss][:group]
  action :create_if_missing
end

execute 'extract_jboss' do
  command "tar xzf #{node['jboss']['zip_file']} -C #{node['jboss']['jboss_path']}"
  not_if { ::File.exist?("#{node['jboss']['jboss_home']}") }
end
