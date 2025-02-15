FROM docker.io/rockylinux:8

LABEL org.opencontainers.image.authors="Niclas Spreng"
LABEL org.opencontainers.image.description="Molecule Container Rockylinux 8"
LABEL org.opencontainers.image.source=https://github.com/DudeCalledBro/molecule-rockylinux8-ansible

RUN rm -f /lib/systemd/system/multi-user.target.wants/*; \
    rm -f /etc/systemd/system/*.wants/*; \
    rm -f /lib/systemd/system/local-fs.target.wants/*; \
    rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
    rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
    rm -f /lib/systemd/system/basic.target.wants/*; \
    rm -f /lib/systemd/system/anaconda.target.wants/*;

# install requirements
RUN yum -qy install rpm dnf-plugins-core \
    && yum -qy update \
    && yum -qy config-manager --set-enabled powertools \
    && yum -qy install \
        epel-release \
        hostname \
        initscripts \
        iproute \
        libyaml-devel \
        python3 \
        python3-pip \
        python3-pyyaml \
        sudo \
        which \
    && yum clean all \
    && rm -rf /var/cache/yum

# disable requiretty
RUN sed -i -e 's/^\(Defaults\s*requiretty\)/#--- \1/'  /etc/sudoers

VOLUME ["/sys/fs/cgroup"]

CMD ["/lib/systemd/systemd"]
