FROM node:16 as build

WORKDIR /usr/src/app

# Copy only the necessary files for dependency installation
COPY package*.json ./

# Install dependencies
RUN npm ci

# Copy the rest of the source code
COPY . .

# Permissions needed for files and folder creation by Cloud Run
RUN chmod 777 /usr/src/app/node_modules

# Expose the port that the application listens on.
EXPOSE 8080

# Run the application.
CMD ["npm", "run", "start"]