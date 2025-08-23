FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV TERM=xterm-256color

RUN apt-get update && apt-get install -y \
    clang-12 \
    clang++-12 \
    libc++-12-dev \
    libc++abi-12-dev \
    make \
    build-essential \
    vim \
    git \
    valgrind \
    gdb \
    && rm -rf /var/lib/apt/lists/*

RUN update-alternatives --install /usr/bin/c++ c++ /usr/bin/clang++-12 100 && \
    update-alternatives --install /usr/bin/cc cc /usr/bin/clang-12 100 && \
    update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-12 100 && \
    update-alternatives --install /usr/bin/clang clang /usr/bin/clang-12 100

RUN echo "=== Compiler Information ===" && \
    c++ --version && \
    echo "=== Make Version ===" && \
    make --version | head -1

WORKDIR /workspace

RUN useradd -m -s /bin/bash dev && \
    chown -R dev:dev /workspace

USER dev

RUN echo 'export PS1="[ft_env] \u@\h:\w\$ "' >> ~/.bashrc

CMD ["/bin/bash"]