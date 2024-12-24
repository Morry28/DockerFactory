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

# Add Docker GPG key and repository, then install Docker CLI
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg && \
    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" \
    > /etc/apt/sources.list.d/docker.list && \
    apt-get update && apt-get install -y docker-ce-cli

# Set working directory
WORKDIR /dockerFactory

COPY welcome.sh .

# Copy all project files to the container
COPY . .

# Start Docker daemon and then bash
CMD ["bash"]
