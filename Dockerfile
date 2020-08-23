FROM gitpod/workspace-full-vnc
USER root
RUN apt-get update                                             \
    && apt-get install -y libgtk-3-dev firefox                 \
    && apt-get install -y chromium chromedriver \
    && apt-get clean && rm -rf /var/cache/apt/* && rm -rf /var/lib/apt/lists/* && rm -rf /tmp/*
USER gitpod
USER root
