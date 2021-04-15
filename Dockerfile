FROM telegraf:latest

RUN apt-get update && \
    apt-get -y install --no-install-recommends \
    fail2ban=0.10.2-2.1 && \
    rm -rf /var/lib/apt/lists/*
