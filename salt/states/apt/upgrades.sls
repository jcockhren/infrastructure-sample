ensure periodic upgrades:
  pkg.installed:
    - name: unattended-upgrades

{% if grains.get('os_family') == 'Debian' %}
enable auto upgrades config file:
  file.managed:
    - name: /etc/apt/apt.conf.d/20auto-upgrades
    - mode: 0644
    - source: salt://apt/20auto-upgrades

ensure the unattended upgrades service is running:
  service.running:
    - name: "unattended-upgrades"
    - listen:
      - file: enable auto upgrades config file
{% endif %}
