* Using these salt states.

These salt-states have been design to allow them to run easily without a salt
master.  To do this, simply clone this repo to your machine, cd into the
cloned repo, and the run the following command:

    sudo salt-call -c local.conf state.sls [state.name]

Here is a list of the currently supported states and what they do:

* openssl
Install the openssl package.  Also provides a template that will generate a
self-signed ssl certificate.

* bitlbee
Installs bitlbee and configures it to listen on 127.0.0.1.  Ensures that the
bitlbee service is running.

* stunnel
Installs stunnel.  Does not attemt to run the service as it can't run without a
service configuration.

* stunnel.bitlbee
Includes the openssl and bitlbee states.  Extends the stunnel state by adding a
config file to listen on prot 6697 and pass the traffic to 127.0.0.1 on port
6667.  Utilizes the self-signed-certificate template to create an ssl cert for
the stunnel.  Ensures that the stunnel is up and running.
