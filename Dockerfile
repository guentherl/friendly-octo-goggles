#FROM gitpod/workspace-full-vnc
USER root
# docker image setup could take 15-30 mins due to the size of the packages and just because it's heavy ubuntu :)

FROM ubuntu:18.04

# install basics first
RUN apt-get update && apt-get install -y python-pip 
RUN apt-get clean 
RUN apt install python3-pip -y 
RUN apt-get install nano wget zip unzip -y
RUN pip3 install --upgrade pip
RUN pip3 install selenium Flask gunicorn requests bs4

# install firefox & gecko driver
RUN apt-get install firefox -y
RUN wget https://github.com/mozilla/geckodriver/releases/download/v0.23.0/geckodriver-v0.23.0-linux64.tar.gz
RUN sh -c 'tar -x geckodriver -zf geckodriver-v0.23.0-linux64.tar.gz -O > /usr/bin/geckodriver'
RUN chmod +x /usr/bin/geckodriver
RUN rm geckodriver-v0.23.0-linux64.tar.gz

# install chromium & chrome driver for chromium (which also works with google chrome of course)
RUN apt-get install chromium-browser -y
RUN apt-get install chromium-chromedriver -y

# install Chinese fonts for ubuntu, otherwise chinese will show up as boxes
RUN apt-get install fonts-arphic-ukai fonts-arphic-uming fonts-ipafont-mincho fonts-ipafont-gothic fonts-unfonts-core -y



USER gitpod
USER root
