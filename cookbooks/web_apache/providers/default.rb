action :install do
  package 'httpd' do
    action :install
  end
end

action :stop do 
  service 'httpd' do
    action :stop
  end
end

action :start do 
  service 'httpd' do
    action :start
  end
end

action :restart do 
  service 'httpd' do
    action :restart
  end
end

action :reload do 
  service 'httpd' do
    action :reload
  end
end

action :setup  do
  service 'httpd' do
    action :enable
  end

template '/var/www/html/index.html' do
    source "index.erb"
  end
end
