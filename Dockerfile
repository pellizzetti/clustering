# Get the official LTS node alpine image
FROM node:lts-alpine

# Directly creating these directories will ensure that they have the permissions we want, we'll also set ownership on them to our node user
RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app

WORKDIR /home/node/app

COPY package*.json ./

# Let's ensure that all of the application files are owned by the non-root node user, including the contents of the node_modules directory
USER node

# Install dependencies
RUN yarn

# Copy with the appropriate permissions
COPY --chown=node:node . .

EXPOSE 3000

CMD [ "node", "server.js" ]

