bitlbee:
  pkg:
    - installed
    - name: bitlbee
  service:
    - running
    - name:    bitlbee
    - enable: true
    - sig: -- '/usr/sbin/bitlbee -p 6667 -P /var/run/bitlbee.pid -F'
    - require:
      - file: /etc/bitlbee/*
    - watch:
      - file: /etc/bitlbee/*

/etc/bitlbee:
  file:
    - directory
    - user: root
    - group: root
    - mode: 700
    - require:
      - pkg: bitlbee

/etc/bitlbee/bitlbee.conf:
  file:
    - managed
    - source: salt://bitlbee/files/bitlbee.conf
    - user: root
    - group: root
    - mode: 600
    - require:
      - file: /etc/bitlbee

/etc/bitlbee/motd.txt:
  file:
    - managed
    - source: salt://bitlbee/files/motd.txt
    - user: root
    - group: root
    - mode: 600
    - require:
      - file: /etc/bitlbee
