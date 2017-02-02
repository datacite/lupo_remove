FROM phusion/passenger-full:0.9.19
MAINTAINER Kristian Garza "kgarza@datacite.org"

ENV SOLR_HOME /data/solr
ENV SOLR_DATA /data/solr/collection1/data
# ENV SOLR_URL http://localhost:8080
# Update installed APT packages, clean up APT when done.
RUN apt-get update && apt-get upgrade -y -o Dpkg::Options::="--force-confold" && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Add solr-client script
COPY source/solr-client /usr/local/bin/solr-client
RUN chmod 0755 /usr/local/bin/solr-client

CMD ["solr-client", "import", "status"]
# CMD ["/sbin/my_init"]
# RUN mkdir -p /etc/my_init.d
# COPY docker/70_templates.sh /etc/my_init.d/70_templates.sh
