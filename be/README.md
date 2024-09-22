# Go Fiber Backend

### Startup checklist

1. Start MySQL Docker

```sh
docker run -d --rm --name mysql -e MYSQL_ROOT_PASSWORD=admin@123 -e MYSQL_DATABASE=primary -p 3306:3306 mysql:9.0.0-oracle
```
