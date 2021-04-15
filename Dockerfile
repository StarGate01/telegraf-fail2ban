FROM telegraf:latest

ENV FAIL2BAN_VERSION="0.11.2"

RUN apt-get update && \
    apt-get -y install --no-install-recommends \
    git python3 python3-setuptools && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir -p /app && \
    cd /app && \
    git clone --single-branch --branch="${FAIL2BAN_VERSION}" --depth=1 https://github.com/fail2ban/fail2ban.git && \
    cd fail2ban && \
    python3 setup.py install 
