#!/bin/bash

# Clone the repository
echo "Cloning repository..."
sudo git clone https://github.com/ahmd7/movie-backend.git
cd movie-backend/
echo "Repository cloned successfully."

# Update system packages
echo "Updating system packages..."
sudo apt-get update
sudo apt-get upgrade -y
echo "System packages updated."

# Install OpenJDK 17
echo "Installing OpenJDK 17..."
sudo apt install openjdk-17-jdk openjdk-17-jre -y
echo "OpenJDK 17 installed."

# Install Maven
echo "Installing Maven..."
sudo apt install maven -y
echo "Maven installed."

# Copy the example .env file
echo "Copying .env.example to .env..."
sudo cp src/main/resources/.env.example src/main/resources/.env
echo ".env file copied successfully."

# Edit .env file to add MongoDB credentials
echo "Adding MongoDB credentials to .env..."
sudo bash -c 'cat <<EOF > src/main/resources/.env
MONGO_DATABASE="movie-api-db"
MONGO_USER="ahmed"
MONGO_PASSWORD="vhmds_74"
MONGO_CLUSTER="cluster0.xf2ckyx.mongodb.net"
EOF'
echo "MongoDB credentials added to .env."

# Run tests
echo "Running tests..."
sudo mvn test
echo "Tests completed successfully."

# Package the application
echo "Packaging the application..."
sudo mvn package
echo "Application packaged successfully."

# Run the application
echo "Running the application..."
sudo java -jar target/movies*
