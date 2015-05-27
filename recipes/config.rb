chef_gem 'toml' do
  action :install
  compile_time true
end

require 'toml'

file '/etc/opt/influxdb/influxdb.conf' do
  content TOML::Generator.new(node['influxdb']['config']).body
end
