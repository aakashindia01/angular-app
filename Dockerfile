# Use an official Node.js runtime as the base image
FROM node:18.17.0 AS build

# Set the working directory inside the container
WORKDIR /app

# Copy the package.json and package-lock.json files
COPY package*.json ./

# Install application dependencies
RUN npm install

# Copy the entire application code to the container
COPY . .

# Build the Angular application
RUN npm run build

# Use an official NGINX image as the base image for serving the application
FROM nginx:1.14.2

# Copy the build output from the 'build' stage to the NGINX web root directory
COPY --from=build /app/dist/angular-app /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start NGINX server
CMD ["nginx", "-g", "daemon off;"]
