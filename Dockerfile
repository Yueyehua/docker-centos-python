FROM yueyehua/centos-base
MAINTAINER Richard Delaplace "rdelaplace@yueyehua.net"
LABEL version="1.0.0"

ENV _PYTHON_VERSION=3.6.1

# Install dependencies
RUN \
  yum -y install git-all gcc gcc-c++ make openssl-devel libcurl-devel \
    readline-devel libffi-devel bzip2 sqlite3

# Clean all
RUN \
  yum clean all;

# Install pyenv
RUN \
  git clone https://github.com/pyenv/pyenv.git ~/.pyenv;

# Install Python
RUN \
  /root/.pyenv/bin/pyenv install ${_PYTHON_VERSION} && \
  /root/.pyenv/bin/pyenv global ${_PYTHON_VERSION};

# Export PATH
ENV PATH=$PATH:/root/.pyenv/bin:/root/.pyenv/shims

RUN \
  pip3 install pylint git-lint;

VOLUME ["/sys/fs/cgroup"]
CMD  ["/lib/systemd/systemd"]
