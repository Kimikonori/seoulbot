FROM python:3.10-slim

WORKDIR /app

# 시스템 빌드 도구 필요시 설치 (chromadb 등 일부 패키지 의존성 대비)
RUN apt-get update && apt-get install -y \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 8080

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8080"]
