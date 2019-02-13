# bolt-examples
Puppet Bolt sample Tasks and Plans.


How to use:
Create a Boltdir folder in your project directory and clone these examples using Git in the Boltfir folder. Bolt commands are run from you project directory.


Contains modules:

epops -> Checks if vROps Endpoint Operations 7.0 agent is installed on RHEL7/CentOS7, if not, then it wil be installed.
 * bolt plan run epops::epops70_linux installdir=vmguru nodes=all

 
Contains manifest blocks:

nginx_install -> Installs nginx and a sample website.
 * bolt puppetfile install
 * bolt plan run profiles::nginx_install nodes=localhost
 
