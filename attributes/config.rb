default['influxdb']['config'] = Chef::Node::ImmutableMash.new(
  'bind-address' => '0.0.0.0',
  'port' => 8086,
  'reporting-disabled' => false,
  'initialization' => {
    'join-urls' => ''
  },
  'authentication' => {
    'enabled' => false
  },
  'admin' => {
    'enabled' => true,
    'port' => 8083
  },
  'api' => {
  },
  'graphite' => [
    {
      'enabled' => false
    }
  ],
  'collectd' => {
    'enabled' => false
  },
  'opentsdb' => {
    'enabled' => false
  },
  'udp' => {
    'enabled' => false
  },
  'broker' => {
    'enabled' => true,
    'dir' => '/var/opt/influxdb/raft',
    'truncation-interval' => '10m',
    'max-topic-size' => 52_428_800,
    'max-segment-size' => 10_485_760
  },
  'raft' => {
    'apply-interval' => '10ms',
    'election-timeout' => '5s',
    'heartbeat-interval' => '100ms',
    'reconnect-timeout' => '10ms'
  },
  'data' => {
    'enabled' => true,
    'dir' => '/var/opt/influxdb/db',
    'retention-auto-create' => true,
    'retention-check-enabled' => true,
    'retention-check-period' => '10m'
  },
  'snapshot' => {
    'enabled' => true
  },
  'logging' => {
    'write-tracing' => false,
    'raft-tracing' => false,
    'http-access' => true
  },
  'monitoring' => {
    'enabled' => false,
    'write-interval' => '1m'
  })
