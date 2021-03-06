# See https://docs.chef.io/config_rb_knife.html for more information on knife configuration options

current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "hicham"
client_key               "#{current_dir}/hicham.pem"
validation_client_name   "nanalab-validator"
validation_key           "#{current_dir}/nanalab-validator.pem"
chef_server_url          "https://api.opscode.com/organizations/nanalab"
cookbook_path            ["#{current_dir}/../cookbooks"]
cookbook_copyright       "nanalab"
cookbook_license         "apachev2"
cookbook_email           "hicham@dahabi.it"