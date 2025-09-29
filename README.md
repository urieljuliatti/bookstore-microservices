# bookstore-microservices
bookstore-microservices

./start_services.sh

# Dockerized setup

## Build and run

```bash
docker compose up --build
```

Services:
- Books API: http://localhost:4000/api/v1
- Storefront: http://localhost:4001

Useful commands:
```bash
# Tail logs
docker compose logs -f

# Prepare databases (one-off)
docker compose run --rm books-service ./bin/rails db:prepare
docker compose run --rm storefront ./bin/rails db:prepare
```

# Get all books
curl http://localhost:4000/api/v1/books

# Get a specific book
curl http://localhost:4000/api/v1/books/1

# Search books
curl "http://localhost:4000/api/v1/books?q=harry"

# Get all authors
curl http://localhost:4000/api/v1/authors