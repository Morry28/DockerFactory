FROM python:3.9-slim as development

# Inštalácia závislostí
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    gcc \
    && rm -rf /var/lib/apt/lists/*

# Inštalácia Python knižníc
RUN pip install --no-cache-dir \
    torch==1.12.0 \
    transformers==4.21.0 \
    google-cloud-storage==2.5.0 \
    numpy

# Nastavenie pracovného adresára
WORKDIR /app

# Kontejner bude očakávať dynamické súbory v priečinku /app
CMD ["bash"]
