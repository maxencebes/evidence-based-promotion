# Using an EOL (End of Life) base image
FROM node:12-alpine

# Set a working directory
WORKDIR /app

# A simple hello world script
RUN echo "console.log('Hello, I am a vulnerable container!');" > index.js

CMD ["node", "index.js"]