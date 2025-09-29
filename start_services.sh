#!/bin/bash

echo "Starting Bookstore Microservices..."

# Start Books Service
cd books-service
rails server -p 3000 &
BOOKS_SERVICE_PID=$!

# Start Storefront App
cd ../storefront
rails server -p 3001 &
STOREFRONT_PID=$!

echo "Books Service running on port 3000 (PID: $BOOKS_SERVICE_PID)"
echo "Storefront running on port 3001 (PID: $STOREFRONT_PID)"
echo "Press Ctrl+C to stop all services"

# Wait for interrupt
trap 'kill $BOOKS_SERVICE_PID $STOREFRONT_PID; exit' INT
wait