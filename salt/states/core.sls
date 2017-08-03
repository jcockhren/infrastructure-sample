core:
  pkg.installed:
    - refresh: True
    - pkgs:
      - apt-transport-https
      - htop
      - vim-nox
      - git-core
      - git
      - python-pip
      - swig
      - g++
      - python-dev
      - libssl-dev
    {% if grains['os'] == 'Debian' %}
      - sudo
    {% endif %}
