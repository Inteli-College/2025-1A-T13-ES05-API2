# syntax=docker/dockerfile:1
# Dockerfile para uma API escrita em Python com FastAPI

# Usa a imagem oficial do Python
FROM python:3.11-slim

# Define o diretório de trabalho dentro do container
WORKDIR /app

COPY . .

ENV PYTHONPATH=/app

# Define o ambiente de desenvolvimento
ENV PYTHONUNBUFFERED=1 \
    PIP_NO_CACHE_DIR=1 \
    PIP_DISABLE_PIP_VERSION_CHECK=1 \
    POETRY_VIRTUALENVS_CREATE=false

# Instala dependências essenciais
RUN apt-get update && apt-get install -y \
    curl \
    build-essential && \
    rm -rf /var/lib/apt/lists/*

# Copia os arquivos de dependências antes para aproveitar cache do Docker
COPY requirements.txt .

# Instala as dependências do projeto
RUN pip install --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# Copia todo o código para o container
COPY . .

# Expõe a porta padrão do FastAPI (Uvicorn)
EXPOSE 8000

# Comando para iniciar a API com hot-reload
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]
