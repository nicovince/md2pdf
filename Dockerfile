FROM ubuntu:24.04

ENV TZ=Europe/Paris
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get update && DEBIAN_FRONTEND="noninteractive" apt-get upgrade -y \
    && apt-get install -y asciidoc \
    && apt-get -y autoremove \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
RUN gem install kramdown-asciidoc
RUN gem install asciidoctor-pdf

RUN adduser --disabled-password docbuilder

COPY entrypoint.sh /entrypoint.sh
VOLUME /src
USER docbuilder
WORKDIR /src

ENTRYPOINT [ "/entrypoint.sh" ]
