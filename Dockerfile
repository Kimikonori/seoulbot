FROM python:3.10-slim

WORKDIR /app

# 빌드 에러 방지를 위한 필수 시스템 패키지 설치
RUN apt-get update && apt-get install -y \
    build-essential \
    g++ \
    libsqlite3-dev \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 8080

CMD exec uvicorn main:app --host 0.0.0.0 --port ${PORT:-8080}
