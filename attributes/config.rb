default['influxdb']['config'] = Chef::Node::ImmutableMash.new(
  'reporting-disabled' => false,
  'meta' => {
    'dir' => '/var/lib/influxdb/meta',
    'hostname' => 'localhost',
    'bind-address' => ':8088',
    'retention-autocreate' => true,
    'election-timeout' => '1s',
    'heartbeat-timeout' => '1s',
    'leader-lease-timeout' => '500ms',
    'commit-timeout' => '50ms'
  },
  'data' => {
    'dir' => '/var/lib/influxdb/data',
    'max-wal-size' => 104_857_600,
    'wal-flush-interval' => '10m0s',
    'wal-partition-flush-delay' => '2s',
    'retention-auto-create' => true,
    'retention-check-enabled' => true,
    'retention-check-period' => '10m0s',
    'retention-create-period' => '45m0s'
  },
  'cluster' => {
    'shard-writer-timeout' => '5s'
  },
  'retention' => {
    'enabled' => true, 'check-interval' => '10m0s'
  },
  'shard-precreation' => {
    'enabled' => true,
    'check-interval' => '10m0s',
    'advance-period' => '30m0s'
  },
  'admin' => {
    'enabled' => true,
    'bind-address' => ':8083'
  },
  'http' => {
    'enabled' => true,
    'bind-address' => ':8086',
    'auth-enabled' => false,
    'log-enabled' => true,
    'write-tracing' => false,
    'pprof-enabled' => false
  },
  'graphite' => [{
    'bind-address' => ':2003',
    'database' => 'graphite',
    'enabled' => false,
    'protocol' => 'tcp',
    'batch-size' => 0,
    'batch-timeout' => '0',
    'consistency-level' => 'one',
    'separator' => '.'
  }],
  'collectd' => {
    'enabled' => false,
    'bind-address' => ':25826',
    'database' => 'collectd',
    'retention-policy' => '',
    'batch-size' => 5000,
    'batch-timeout' => '10s',
    'typesdb' => '/usr/share/collectd/types.db'
  },
  'opentsdb' => {
    'enabled' => false,
    'bind-address' => ':4242',
    'database' => 'opentsdb',
    'retention-policy' => '',
    'consistency-level' => 'one'
  },
  'udp' => {
    'enabled' => false,
    'bind-address' => '',
    'database' => '',
    'batch-size' => 0,
    'batch-timeout' => '0'
  },
  'monitoring' => {
    'enabled' => false,
    'write-interval' => '1m0s'
  },
  'continuous_queries' => {
    'enabled' => true,
    'recompute-previous-n' => 2,
    'recompute-no-older-than' => '10m0s',
    'compute-runs-per-interval' => 10,
    'compute-no-more-than' => '2m0s'
  },
  'hinted-handoff' => {
    'enabled' => true,
    'dir' => '/var/lib/influxdb/hh',
    'max-size' => 1_073_741_824,
    'max-age' => '168h0m0s',
    'retry-rate-limit' => 0,
    'retry-interval' => '1s'
  }
)
