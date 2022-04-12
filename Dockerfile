FROM telegraf:latest

ARG PYTHON_VERSION="3.9.7"
ARG FAIL2BAN_VERSION="0.11.2"

RUN apt-get update && \
    apt-get -y install --no-install-recommends \
    sudo git build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libsqlite3-dev libreadline-dev libffi-dev curl libbz2-dev && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir -p /app && cd /app && \
    curl -O https://www.python.org/ftp/python/${PYTHON_VERSION}/Python-${PYTHON_VERSION}.tar.xz && \
    tar -xf Python-${PYTHON_VERSION}.tar.xz && cd /app/Python-${PYTHON_VERSION} && \
    ./configure --enable-optimizations && make -j$(nproc) && make install && \
    cd /app && \
    curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && python3 get-pip.py && pip3 install setuptools && \
    git clone --single-branch --branch="${FAIL2BAN_VERSION}" --depth=1 https://github.com/fail2ban/fail2ban.git && \
    cd /app/fail2ban && python3 setup.py install && \
    rm -rf /app
