FROM jenkins/jenkins:lts

USER root
RUN apt-get update && apt-get install -y \
    build-essential \
    rpm \
    dpkg-dev \
    git \
    bash

WORKDIR /usr/share/jenkins/ref

COPY ./your-build-scripts /usr/share/jenkins/ref

RUN /usr/local/bin/install-plugins.sh \
    git \
    pipeline \
    blueocean

EXPOSE 8080

ENTRYPOINT ["/bin/tini", "--", "/usr/local/bin/jenkins.sh"]
