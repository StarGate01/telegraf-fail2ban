FROM telegraf:latest

RUN apt-get update && \
    apt-get -y install --no-install-recommends \
    fail2ban && \
    rm -rf /var/lib/apt/lists/*
