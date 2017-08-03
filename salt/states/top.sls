{% set roles = pillar.get('roles', []) -%}
{% set dependencies = pillar.get('dependencies', []) -%}

base:
  '*':
    - core
{% for dep in dependencies %}
    - {{ dep }}
{% endfor %}
{% for role in roles %}
    - {{ role }}
{% endfor %}
