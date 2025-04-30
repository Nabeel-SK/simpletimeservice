Task 1: SimpleTimeService Flask App + Docker (README)

📄 Project Overview

SimpleTimeService is a minimalist Flask application that returns the current Indian Standard Time (IST) and the visitor's IP address in JSON format. The app is containerized using Docker and built with security best practices (non-root user).

🔧 Features

Returns Indian timestamp (Asia/Kolkata timezone)

Detects and returns the client IP

Flask-based lightweight REST API

Dockerized using a slim Python base image

Non-root user for security inside container

📁 Directory Structure

simple-time-service/
├── app/
│   └── app.py
├── Dockerfile
├── README.md

⚙️ How to Build and Run the Docker Container

Step 1: Clone the Repository

git clone https://github.com/your-username/simple-time-service.git
cd simple-time-service

Step 2: Build the Docker Image

docker build -t simple-time-service .

Step 3: Run the Docker Container

docker run -p 8080:8080 simple-time-service

Step 4: Access the Application

Visit in browser or test using curl:

curl http://localhost:8080

✅ You’ll receive:

{
  "timestamp": "2025-04-27T13:10:30+05:30",
  "ip": "127.0.0.1"
}

🐳 DockerHub Image

Image is published at:

docker pull nabeel111/simple-time-service:latest

✅ Final Notes

Make sure Docker is installed and running

Port 8080 must be open if hosted on EC2

Bind the Flask app to 0.0.0.0 to make it accessible outside container


