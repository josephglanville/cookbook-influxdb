chef_gem 'toml' do
  action :install
  compile_time true
end

require 'toml'

file '/etc/opt/influxdb/influxdb.conf' do
  content TOML::Generator.new(node['influxdb']['config']).body
end

if node['influxdb'].attribute? 'ec2'
  template '/opt/influxdb/influxd-ec2' do
    mode 0755
    variables address_type: node['influxdb']['ec2']['address_type'],
              tags: node['influxdb']['ec2']['tags']
  end
end
