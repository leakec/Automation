# Build
The following steps can be used to build the website:

1. Run "make all"
1. Open the server using the link provided by the mkdocs output.
1. Use "ctrl + C" to close the server when done.

# Local file build (no server)
The following steps will build the website locally. Note, the search functionality will not work 
when building locally.

1. Run "make local"
1. Open site/index.html to view the cookbook.

# Setting up website for at home viewing V2
These steps will make your website viewable on your local network from a name like `myhost.local`.
1. Create apache2 website. Follow [this tutorial](https://ubuntu.com/tutorials/install-and-configure-apache#1-overview)
  * May need to add `sudo ufw allow 'Apache'` to allow access from home network.
  * Will need to add all the files from `site` to your website, e.g., `sudo cp -r site/* /var/www/home/`
  * Worth double checking here that it is viewable locally. Can you use the computers IP address for this, or just `localhost`.
2. Use `mDNS` to host website over local network. Note, you will need to make the `ServerName=myhost.local`, where `myhost` matches the `host-name` in `/etc/avahi/avahi-daemon.conf`

