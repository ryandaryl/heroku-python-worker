FROM nvidia/cuda:10.1-runtime-ubuntu18.04
RUN TZ=Australia/Melbourne ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
    && echo $TZ > /etc/timezone
RUN apt update && apt-get install -y build-essential checkinstall \
    libreadline-gplv2-dev libncursesw5-dev libssl-dev \
    libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev libffi-dev zlib1g-dev \
    curl wget
WORKDIR /opt
RUN wget https://www.python.org/ftp/python/3.9.0/Python-3.9.0.tgz
RUN tar xzf Python-3.9.0.tgz
WORKDIR /opt/Python-3.9.0
RUN ./configure --enable-optimizations
RUN make altinstall
RUN update-alternatives --install /usr/bin/python python /usr/local/bin/python3.9 10
RUN curl https://bootstrap.pypa.io/get-pip.py | python
WORKDIR /opt
RUN wget http://download.redis.io/redis-stable.tar.gz
RUN tar xvzf redis-stable.tar.gz
WORKDIR redis-stable
RUN make install
WORKDIR /opt
COPY requirements.txt /opt
RUN pip install -r /opt/requirements.txt
RUN echo 'export HOST="localhost"' > /etc/profile.d/env_vars.sh
