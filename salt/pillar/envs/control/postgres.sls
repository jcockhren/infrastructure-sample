postgres:
  version: '9.4'
  pkgs_extra:
    - postgresql-9.4-postgis-2.3
  users:
    ubuntu:
      ensure: present
      createdb: True
      superuser: True
      createroles: False
      createuser: False
      inherit: True
      replication: False
  acls:
    - ['local', 'all', 'all', 'trust']
    - ['host', 'all', 'all', '127.0.0.1/32', 'trust']
