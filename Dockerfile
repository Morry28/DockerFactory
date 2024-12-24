# Base image
FROM ubuntu:20.04

# Set environment variable to suppress interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Update system and install required packages
RUN apt-get update && apt-get install -y \
    curl \
    git \
    nano \
    sudo \
    apt-transport-https \
    ca-certificates \
    software-properties-common \
    docker.io && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Configure Docker daemon
RUN mkdir -p /etc/docker && echo '{"experimental":true}' > /etc/docker/daemon.json

# Set working directory
WORKDIR /dockerFactory

# Copy all project files to the container
COPY . .

# Ensure welcome.sh is executable
RUN chmod +x welcome.sh

# Expose Docker daemon socket port
EXPOSE 2375

# Default command: Start Docker daemon with full permissions and run welcome.sh
CMD ["sh", "-c", "dockerd --host=unix:///var/run/docker.sock --host=tcp://0.0.0.0:2375 & sleep 5 && ./welcome.sh && bash"]
