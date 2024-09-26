# Use the official Node.js image.
FROM node:14

# Create and set the working directory.
WORKDIR /usr/src/app

# Copy package.json and package-lock.json.
COPY package*.json ./

# Install dependencies.
RUN npm install

# Copy the rest of your application code.
COPY . .

# Expose the application port (Change if using a different port).
EXPOSE 3000

# Start the application.
CMD [ "npm", "run", "dev" ]

