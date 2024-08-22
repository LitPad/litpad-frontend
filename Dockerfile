# Use the official Dart image as a parent image
FROM ghcr.io/cirruslabs/flutter:3.24.0-0.2.pre AS build

# Set the working directory
WORKDIR /app

# Copy the code into the container
COPY . .

# Fetch the dependencies
RUN flutter pub get
RUN flutter pub upgrade

# Build the application (for web)
RUN flutter build web --web-renderer html

# Use Nginx to serve the app
FROM nginx:alpine

# Copy the build artifacts from the build stage, and the Nginx configuration
COPY --from=build /app/build/web /usr/share/nginx/html

EXPOSE 3000

CMD ["nginx", "-g", "daemon off;"]