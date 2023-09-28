FROM ubuntu:focal
RUN apt update
RUN apt upgrade -y
# install dependencies
RUN apt install -y ruby ruby-bundler ruby-dev git libyaml-dev
RUN gem install vanagon
# move over the executables
ADD https://github.com/puppetlabs/security-snyk-vanagon-action/releases/latest/download/vanagon_action /usr/local/bin/vanagon_action
# ADD vanagon_action /usr/local/bin/vanagon_action
RUN chmod +x /usr/local/bin/vanagon_action
# install snyk
ADD https://github.com/snyk/cli/releases/download/v1.908.0/snyk-linux /usr/local/bin/snyk 
RUN chmod 751 /usr/local/bin/snyk
# startup script and startup
ADD docker_confs/start_script.sh /usr/local/bin/start_script.sh
RUN chmod +x /usr/local/bin/start_script.sh
CMD ["start_script.sh"]
