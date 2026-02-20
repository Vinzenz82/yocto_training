FROM ubuntu:22.04

# Abhängigkeiten installieren
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    git \
    build-essential \
    python3 \
    python3-pip \
    nodejs \
    npm \
    && rm -rf /var/lib/apt/lists/*

# code-server installieren
RUN curl -fsSL https://code-server.dev/install.sh | sh

# Arbeitsverzeichnis erstellen
WORKDIR /home/coder

# Port für code-server freigeben
EXPOSE 8080

# code-server starten
CMD ["code-server", "--bind-addr", "0.0.0.0:8080"]
