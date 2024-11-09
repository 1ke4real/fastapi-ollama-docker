FROM ollama/ollama
LABEL authors="Mike Leman"
LABEL maintainer="Mike Leman"

ENV APP_HOME=/home

WORKDIR $APP_HOME

COPY . .

RUN chmod +x ./docker/ollama/pull-llama3.sh

ENTRYPOINT ["/usr/bin/bash", "./docker/ollama/pull-llama3.sh"]