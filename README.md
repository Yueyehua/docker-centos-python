debian-python
=============

This is a CentOS 7 docker image with python and pyenv installed.

Prerequisites
-------------

- Docker

Usage
-----

```text
docker pull yueyehua/centos-python
docker run \
  -d \                                           # daemonize
  --privileged \                                 # for systemd
  -v /sys/fs/cgroup:/sys/fs/cgroup:ro \          # for systemd
  --name python \                                # container name
  -h python \                                    # hostname
  yueyehua/centos-python
docker exec -ti python bash
[Do something here]
docker stop python
docker rm python
```
