Oracle Weblogic
===============

Hi! This is a simple script to execute an Oracle Weblogic container using
docker and the "almost" official image.

Setup
-----

You will need to have Docker and a good Internet connection to download the
image, ok?

First step: Clone this repo somewhere in your workstation or server where you
want to keep the Weblogic volume disk. In my case, my home dir is
`/home/wesley`, and I have a lot of space there, so:

```
$ cd /home/wesley/
$ git clone https://github.com/wesleyit/ws_oracle_weblogic.git weblogic
$ cd weblogic/
$ ls
reset_weblogic_password.sh  start_weblogic.sh
```

Next step: Execute the `start_weblogic.sh` script. It will create the
`base_domain` directory with your volume files. This script will also
reset the `weblogic` user password to `p4ssword`.

Next step: Login to **[http://localhost:7001/console]()** and use the
credentials provided above.


Password
--------

To reset the password, just execute the same script using `reset` as argument:
```
$ start_weblogic.sh reset
```
