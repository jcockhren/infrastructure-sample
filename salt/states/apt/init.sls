{% set apt = "/etc/apt/sources.list.d" %}
{{apt}}/sophicware.list:
  file.managed:
    - source: salt://apt/company.list
    - user: root
    - group: root
    - mode: 644
  pkg.installed:
    - name: apt-transport-https

erlang:
  pkgrepo.managed:
    - humanname: Erlang OTP
    - name: deb http://packages.erlang-solutions.com/ubuntu {{grains['oscodename']}} contrib
    - file: {{apt}}/erlang.list
    - key_url: http://packages.erlang-solutions.com/ubuntu/erlang_solutions.asc
    - unless: ls {{apt}}/erlang.list

{% if grains['os'] == 'Ubuntu' %}

brightbox:
  pkgrepo.managed:
    - humanname: BrightBox Rubies
    - ppa: brightbox/ruby-ng
    - unless: ls {{apt}}/brightbox-ruby-ng-trusty.list

lea-nodejs:
  pkgrepo.managed:
    - humanname: Chris Lea
    - ppa: chris-lea/node.js
    - unless: ls {{apt}}/chris-lea-node_js-trusty.list

{% endif %}
