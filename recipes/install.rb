repo = node['influxdb']['repo']
version = node['influxdb']['version']
arch = node['influxdb']['arch']
filename = "influxdb_#{version}_#{arch}.deb"
url = ::File.join(repo, filename)
tmp_path = ::File.join('/tmp', filename)

dpkg_package 'influxdb' do
  source tmp_path
  action :nothing
end

remote_file tmp_path do
  source url
  notifies :install, 'dpkg_package[influxdb]', :immediately
  not_if 'dpkg -s influxdb'
end

link '/usr/bin/influx' do
  to '/opt/influxdb/influx'
end
