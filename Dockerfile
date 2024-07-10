FROM python:3.10-slim

RUN apt-get update && apt-get install -y \
    gcc \
    g++ \
    python3-dev \
    cron \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/app

# COPY requirements.txt ./
RUN pip install --upgrade pip
# RUN pip install --no-cache-dir -r requirements.txt

COPY . .
ENV PYTHONPATH="/usr/src/app"
ENTRYPOINT [ "python", "server.py" ]