FROM debian:12-slim AS final

RUN apt-get update && apt-get install -y curl && \
    curl -fsSL https://claude.ai/install.sh | bash && \
    cp /root/.local/bin/claude /usr/local/bin/claude && \
    chmod 755 /usr/local/bin/claude


ARG UID=10001
RUN adduser \
    --disabled-password \
    --gecos "" \
    --home "/home/aiuser" \
    --shell "/bin/bash" \
    --uid "${UID}" \
    aiuser

RUN mkdir -p /home/aiuser/.claude && \
    chown -R aiuser:aiuser /home/aiuser/.claude

RUN mkdir /workspace && chown aiuser:aiuser /workspace

WORKDIR /workspace

USER aiuser

ENTRYPOINT [ "claude" ]
