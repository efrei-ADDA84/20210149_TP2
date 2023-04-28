FROM python:3.9-alpine

WORKDIR /app

RUN pip install flask
RUN pip install requests

ARG API_KEY

COPY . .

CMD ["python", "api.py"]
