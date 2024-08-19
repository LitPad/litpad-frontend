# Stage 1: Build the Flutter web project
FROM debian:latest AS build
# Install required dependencies
RUN apt-get update && apt-get install -y \
    curl \
    git \
    unzip \
    xz-utils \
    libglu1-mesa \
    && rm -rf /var/lib/apt/lists/*

# Install Flutter SDK
WORKDIR /usr/local
RUN curl -LO https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.10.6-stable.tar.xz \
    && tar xf flutter_linux_3.10.6-stable.tar.xz \
    && rm flutter_linux_3.10.6-stable.tar.xz

# Set Flutter in PATH
ENV PATH="/usr/local/flutter/bin:/usr/local/flutter/bin/cache/dart-sdk/bin:${PATH}"

# Enable Flutter web
RUN flutter channel stable && flutter upgrade && flutter config --enable-web

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
