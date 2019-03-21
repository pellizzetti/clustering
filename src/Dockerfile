# Get the official LTS node alpine image
FROM node:lts-alpine

# Directly creating these directories will ensure that they have the permissions we want, we'll also set ownership on them to our node user
RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app

# Set the working directory of the application
WORKDIR /home/node/app

# Copy dependencies files before installing to take advantage of Docker's caching mechanism
COPY package.json yarn.lock ./

# Let's ensure that all of the application files are owned by the non-root node user, including the contents of the node_modules directory
USER node

# Install dependencies
RUN yarn

# Copy with the appropriate permissions
COPY --chown=node:node . .

# Expose default port of the container
EXPOSE 3333

# Runs this command when the container is created, can be overriden in the docker-compose.yml
CMD ["yarn", "start"]
