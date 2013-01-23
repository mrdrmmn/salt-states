include:
  - bitlbee
  - stunnel

extend:
  stunnel:
    service:
      - running
      - enable: true
      - sig: /usr/bin/stunnel4 /etc/stunnel/bitlbee.conf
      - require:
        - file: /etc/stunnel/bitlbee.conf
        - file: /etc/ssl/private/bitlbee.pem
      - watch:
        - file: /etc/stunnel/bitlbee.conf
        - file: /etc/ssl/private/bitlbee.pem

/etc/stunnel/bitlbee.conf:
  file:
    - managed
    - source: salt://stunnel/files/bitlbee.conf
    - user: root
    - group: root
    - mode: 600
    - require:
      - file: /etc/stunnel

/etc/ssl/private/bitlbee.pem:
  file:
    - managed
    - source: salt://openssl/files/self-signed-certificate
    - template: py
    - user: root
    - group: root
    - mode: 700
    - replace: false
