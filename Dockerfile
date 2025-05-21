# Dockerfile pour compilation & debugging multi-arch (x86_64 & ARM64)
FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
      # émulation ARM64
      binfmt-support \
      qemu-user-static \
      qemu-user \
      # toolchains & dev headers
      build-essential \
      gcc \
      libc6-dev \
      libc6-dev-arm64-cross \
      gcc-aarch64-linux-gnu \
      # debug & introspection
      gdb \
      gdb-multiarch \
      # Python3 et Pwntools
      python3 \
      python3-pip \
    && pip3 install --no-cache-dir pwntools \
    && rm -rf /var/lib/apt/lists/*

RUN dpkg --add-architecture i386 && \
    apt update && \
    apt install -y libc6:i386 libncurses5:i386 libstdc++6:i386


# Montez votre dossier ./shared ici
VOLUME ["/shared"]
WORKDIR /shared

CMD ["bash"]