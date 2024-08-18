# Stage 1: Build the Flutter web project
FROM cirrusci/flutter:3.10.6 as build

# Set working directory
WORKDIR /app

# Copy the Flutter project files
COPY . .

# Ensure dependencies are installed
RUN flutter pub get

# Build the project for web
RUN flutter build web --release

# Stage 2: Serve the static files with nginx
FROM nginx:stable-alpine

# Copy the built files from the previous stage
COPY --from=build /app/build/web /usr/share/nginx/html

# Change the default nginx port to 3000
RUN sed -i 's/listen .*/listen 3000;/' /etc/nginx/conf.d/default.conf

# Expose the new port
EXPOSE 3000

# Start nginx server
CMD ["nginx", "-g", "daemon off;"]
