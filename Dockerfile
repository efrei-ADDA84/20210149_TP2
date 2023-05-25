FROM python:3.9-alpine

WORKDIR /app

RUN pip install --no-cache-dir requests==2.29.0 flask==2.3.0

COPY . .

CMD ["python", "api.py"]
