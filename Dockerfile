FROM jenkins/jenkins:lts

USER root
RUN apt-get update && apt-get install -y \
    build-essential \
    rpm \
    dpkg-dev \
    git \
    curl

RUN jenkins-plugin-cli --plugins "github-branch-source"
USER jenkins

EXPOSE 8080
