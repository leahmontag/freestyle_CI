# Use Node.js 21.0.0 slim image as the base image
FROM node:21.0.0-slim

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json to the container
COPY package*.json ./

# Install app dependencies for development
RUN npm install

# Copy the rest of the application code to the container
COPY . .

# Expose the port that your app is listening on (e.g., 3000)
EXPOSE 4000

# Set the NODE_ENV to "development"
ENV NODE_ENV=development

# Set the DATABASE_CONNECTIONSTRING environment variable
ENV DATABASE_CONNECTIONSTRING=mongodb://mongodb:27017/pucsd

# Define the command to start your Node.js application
CMD ["node", "index.js"]
