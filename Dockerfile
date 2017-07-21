FROM jenkinsci/jnlp-slave:latest
USER root
RUN apt-get -q update && \
    apt-get -q install -y apt-transport-https ca-certificates python-pip libpython-dev && \
    echo 'deb https://apt.dockerproject.org/repo debian-jessie main' >> /etc/apt/sources.list.d/docker.list && \
    curl https://apt.dockerproject.org/gpg > docker.gpg.key && \
    echo "c836dc13577c6f7c133ad1db1a2ee5f41ad742d11e4ac860d8e658b2b39e6ac1 docker.gpg.key" | sha256sum -c && \
    apt-key add docker.gpg.key && \
    rm docker.gpg.key && \
    apt-get -q update && \
    apt-cache policy docker-engine && \
    apt-get -q install -y docker-engine=1.11.2-0~jessie && \
    apt-get clean -y && \
    rm -rf /var/lib/apt/lists/*

RUN pip install awscli
