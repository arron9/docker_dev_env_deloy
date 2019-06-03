# db1

### Docker Compose

When there is a need to run tests with MySQL and Redis, launching them via docker container is more convenient.

1. Spin up Mysql and Redis by `docker-compose up -d` before test
1. Run tests
1. tear them down by `docker-compose down` after test


