# Replace SysV init with Upstart
execute 'disable-influxdb' do
  command 'update-rc.d influxdb remove'
  action :nothing
end

file '/etc/init.d/influxdb' do
  action :delete
  notifies :run, 'execute[disable-influxdb]'
end

template '/etc/init/influxdb.conf' do
  variables ec2: node['influxdb'].attribute?('ec2')
end
