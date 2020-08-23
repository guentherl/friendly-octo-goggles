#FROM gitpod/workspace-full-vnc
USER root
# docker image setup could take 15-30 mins due to the size of the packages and just because it's heavy ubuntu :)
WORKDIR /app
FROM python:3.7

# install basics first
RUN apt-get update
RUN pip install --upgrade pip
RUN pip install selenium Flask gunicorn requests bs4

# install chromium & chrome driver for chromium (which also works with google chrome of course)
RUN apt-get install chromium-browser -y
RUN apt-get install chromium-chromedriver -y

USER gitpod
USER root
