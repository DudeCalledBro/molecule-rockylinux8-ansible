# Molecule Container - Rockylinux 8

[![CI](https://github.com/DudeCalledBro/molecule-rockylinux8-ansible/actions/workflows/ci.yml/badge.svg)](https://github.com/DudeCalledBro/molecule-rockylinux8-ansible/actions/workflows/ci.yml)

This repository is used to build Rockylinux 8 Docker images for Ansible [Molecule](https://ansible.readthedocs.io/projects/molecule/).

## Tags

- `latest`: [Rockylinux 8 Upstream](https://hub.docker.com/_/rockylinux) with Python 3.x

## Build

This image build is scheduled with GitHub Actions and will be pushed to DockerHub. The image will also be rebuilt, if the `main` branch is updated. If you need to build the image locally, ensure [Docker](https://docs.docker.com/engine/installation/) is installed and execute the following:

```bash
docker build -t molecule-rockylinux8-ansible:latest .
```

## License

Copyright © 2024 Niclas Spreng

Licensed under the [MIT license](LICENSE).
