FROM ubuntu:latest

LABEL "maintainer"="Mike Schneider <mschneider@se-dev.com>"
LABEL "repo"="https://github.com/makton-dev/awscli-terraform"
LABEL "homepage"="https://github.com/makton-dev/awscli-terraform"

# Installed dependent packages
RUN apt-get update && apt-get -y install unzip wget curl gnupg

# Add terraform repo
RUN curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add -
RUN apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"

# Install Terraform. Also unzip and wget for awscli
RUN apt-get update && apt-get -y install terraform

# download and install awscli
RUN wget https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip
RUN unzip awscli-exe-linux-x86_64.zip
RUN bash ./aws/install

ADD entry.sh /entry.sh
ENTRYPOINT ["/entry.sh"]
