# app/Dockerfile

FROM python:3.9-slim

EXPOSE 8507

WORKDIR /app

RUN apt-get update && apt-get install -y \
    build-essential \
    software-properties-common \
    && rm -rf /var/lib/apt/lists/*

COPY ./requirements.txt ./requirements.txt

RUN pip3 install -r requirements.txt

COPY . .

ENTRYPOINT ["streamlit", "run", "gui.py", "--server.port=80", "--server.address=0.0.0.0"]
#ENTRYPOINT ["streamlit", "run", "main.py", "--server.port=80","--server.enableXsrfProtection=false","--server.enableCORS=false"]
