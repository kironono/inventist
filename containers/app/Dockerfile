FROM ruby:2.7.2

LABEL maintainer "Junichi Kakisako <kilo.sw@gmail.com>"

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    postgresql-client \
    yarn \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# Add Tini
# ENV TINI_VERSION v0.15.0
# ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
# RUN chmod +x /tini
# ENTRYPOINT ["/tini", "--"]

RUN mkdir /app
WORKDIR /app
