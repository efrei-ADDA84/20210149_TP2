FROM python:3.9-alpine

WORKDIR /app

RUN pip install Flask jsonify request

ARG API_KEY

COPY . .

CMD ["python", "api.py"]
