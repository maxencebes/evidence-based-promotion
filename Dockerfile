# Using an EOL (End of Life) base image
FROM node:12-alpine

# Set a working directory
WORKDIR /app

# Optional: Add an intentionally old, vulnerable package via shell
# This might trigger 'Critical' alerts for known shell exploits
RUN apk add --no-cache bash=5.0.0-r0

# A simple hello world script
RUN echo "console.log('Hello, I am a vulnerable container!');" > index.js

CMD ["node", "index.js"]