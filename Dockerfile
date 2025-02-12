# Use the official Flutter image from Docker Hub (stable version)
FROM ghcr.io/cirruslabs/flutter:latest

# Set the working directory
WORKDIR /app

# Copy pubspec files first (for caching dependencies)
COPY pubspec.yaml pubspec.lock ./

# Install dependencies
RUN flutter pub get

# Copy the entire project
COPY . .

# Build the release APK
RUN flutter build apk --release

# Set the default command
CMD ["bash"]
