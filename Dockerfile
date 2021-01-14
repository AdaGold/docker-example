# Starting Image
FROM node:14-alpine

# Create a folder for our app and make
# it the working directory
RUN mkdir /app
WORKDIR /app


# Install Yarn
# Tell Container where to find Yarn
RUN apk add --update \
    curl \
    && rm -rf /var/cache/apk/*
RUN apk add yarn

# Install application to /app
COPY package.json yarn.lock /app/
RUN yarn install --production=true

COPY . /app

EXPOSE 3000

CMD ["yarh", "start"]
