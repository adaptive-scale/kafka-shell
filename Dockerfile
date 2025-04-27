FROM python:3.11-slim-bookworm

RUN mkdir -p /opt/kafka-shell
WORKDIR /opt/kafka-shell

COPY . .

RUN pip install -e .

RUN python setup.py sdist bdist_wheel

RUN ls dist/*
RUN pip install ./dist/kafka-shell-0.1.4.tar.gz

ENTRYPOINT [ "kafka-shell" ]
