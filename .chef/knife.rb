current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "egor"
client_key               "#{current_dir}/egor.pem"
chef_server_url          "https://chef_server/organizations/egor"
cookbook_path            "/root/cookbooks"
validation_key           "/root/.chef/egor-validator.pem"
validation_client_name   "egor"
