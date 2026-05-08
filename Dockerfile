FROM eclipse-temurin:21-jdk-jammy

RUN apt-get update && apt-get install -y \
    bash \
    curl \
    git \
    unzip \
    procps \
    ca-certificates \
    sudo \
    python3 \
    python3-pip \
    python3-venv \
    build-essential \
    gcc \
    g++ \
    make \
    && rm -rf /var/lib/apt/lists/*

RUN curl -fsSL https://claude.ai/install.sh | bash && \
    cp /root/.local/bin/claude /usr/local/bin/claude && \
    chmod 755 /usr/local/bin/claude

ARG UID=10001

RUN useradd -m -u ${UID} -s /bin/bash aiuser && \
    echo "aiuser ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

ENV HOME=/home/aiuser

WORKDIR /workspace

RUN mkdir -p /workspace && \
    chown -R aiuser:aiuser /workspace

USER aiuser

ENTRYPOINT ["claude", "--dangerously-skip-permissions"]

