FROM gitpod/workspace-full-vnc
USER root
RUN apt-get update                                             \
    && apt-get install -y libgtk-3-dev firefox                 \
    && apt-get install -y chromium-browser chromium-chromedriver \
    && apt-get clean && rm -rf /var/cache/apt/* && rm -rf /var/lib/apt/lists/* && rm -rf /tmp/*
RUN wget https://github.com/mozilla/geckodriver/releases/download/v0.23.0/geckodriver-v0.23.0-linux64.tar.gz
RUN sh -c 'tar -x geckodriver -zf geckodriver-v0.23.0-linux64.tar.gz -O > /workspace/geckodriver'
RUN chmod +x geckodriver
RUN rm geckodriver-v0.23.0-linux64.tar.gz
USER gitpod
USER root
