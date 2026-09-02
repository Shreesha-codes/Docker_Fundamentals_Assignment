#!/bin/bash

echo "Building images..."
docker build -t nodejs-app ./nodejs-app
docker build -t python-app ./python-app
docker build -t java-app ./java-app
docker build -t apache-app ./Apache-app
docker build -t react-app ./React-app
docker build -t nginx-app ./nginx-app

echo "Running containers..."
docker run -d --name node-container -p 3000:3000 nodejs-app
docker run -d --name python-container -p 5000:5000 python-app
docker run -d --name java-container -p 8080:8080 java-app
docker run -d --name apache-container -p 8081:80 apache-app
docker run -d --name react-container -p 3001:80 react-app
docker run -d --name nginx-container -p 8082:80 nginx-app

echo "Waiting for containers to start..."
sleep 5

echo "Verifying outputs..."
echo "Node.js (3000): $(curl -s http://localhost:3000)"
echo "Python (5000): $(curl -s http://localhost:5000)"
echo "Java (8080): $(curl -s http://localhost:8080)"
echo "Apache (8081): $(curl -s http://localhost:8081 | grep -o '<h1>.*</h1>' || curl -s http://localhost:8081)"
echo "React (3001): $(curl -s http://localhost:3001 | grep -o '<h1>.*</h1>' || curl -s http://localhost:3001)"
echo "Nginx (8082): $(curl -s http://localhost:8082 | grep -o '<h1>.*</h1>' || curl -s http://localhost:8082)"

echo "Verification complete!"
echo "To stop and remove containers, run:"
echo "docker stop node-container python-container java-container apache-container react-container nginx-container"
echo "docker rm node-container python-container java-container apache-container react-container nginx-container"
