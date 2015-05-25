#################################################
# Debian with added varnish Server.
# Basic varnish with ACL.
#################################################

# Using latest debian image as base
FROM debian:latest

MAINTAINER hihouhou < hihouhou@hihouhou.com >

ENV DEBIAN_FRONTEND noninteractive

# install dependancies
RUN apt-get update && apt-get install -y varnish

#configure varnish
COPY varnish /etc/default/varnish

#configure vcl
COPY default.vcl /etc/varnish/


# startup
EXPOSE 80

#CMD ["varnishd", "-a", ":80", "-T", "localhost:6082", "-f", "/etc/varnish/default.vcl", "-S", "/etc/varnish/secret", "-s", "malloc,256m"]

ADD start.sh /start.sh
RUN chmod 0755 /start.sh
CMD ["/start.sh"]
