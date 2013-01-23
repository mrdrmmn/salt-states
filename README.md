# How to utilize

These salt-states have only been tested on Debian Squeeze.  They have been
designed to allow them to run easily without a salt master.  To do this, first
install git and salt-minion.

    sudo aptitude install git salt-minion

Then clone this repo to your machine.

    git clone https://github.com/therevmj/salt-states.git

Change into the directory created by cloning the repo.

    cd salt-states

Finally, execute the state of your choosing.

    sudo salt-call -c local.conf state.sls [state.name]

# Provided States

* **openssl**
  Install the openssl package.  Also provides a template that will generate a
  self-signed ssl certificate.

* **bitlbee**
  Installs bitlbee and configures it to listen on 127.0.0.1.  Ensures that the
  bitlbee service is running.

* **stunnel**
  Installs stunnel.  Does not attemt to run the service as it can't run without
  a service configuration.

* **stunnel.bitlbee**
  Includes the openssl and bitlbee states.  Extends the stunnel state by adding
  a config file to listen on prot 6697 and pass the traffic to 127.0.0.1 on
  port 6667.  Utilizes the self-signed-certificate template to create an ssl
  cert for the stunnel.  Ensures that the stunnel is up and running.
