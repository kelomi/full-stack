#!/bin/bash
# This script should be run once manually on EC2 to set up MySQL

# Create docker network
docker network create app-network

# Run MySQL container
docker run -d \
  --name mysql \
  --network app-network \
  --restart always \
  -e MYSQL_ROOT_PASSWORD=$DB_PASSWORD \
  -e MYSQL_DATABASE=crud_operations \
  -p 3306:3306 \
  -v mysql_data:/var/lib/mysql \
  mysql:5.7

# Wait for MySQL to be ready
sleep 30

# Create necessary tables (optional - if you have schema files)
# docker exec -i mysql mysql -uroot -p$DB_PASSWORD crud_operations < schema.sql