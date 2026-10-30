FROM python:3.10-slim

WORKDIR /app

RUN apt-get update && apt-get install -y \
    build-essential \
    g++ \
    libsqlite3-dev \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 8080

# 셸 형식을 사용하여 PORT 환경변수가 올바르게 대입되도록 수정
CMD uvicorn main:app --host 0.0.0.0 --port ${PORT:-8080}
