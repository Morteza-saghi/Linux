# Reverse Proxying To Containers

## Overview

Reverse proxying with NGINX allows you to route incoming requests to a backend application running in a container. This setup is useful when you want to expose your application through a friendly domain while keeping the backend services isolated.

In this guide, we'll configure NGINX to forward requests from `this.ir/hello/` to a containerized application.

## Steps to Configure NGINX as a Reverse Proxy 

### Way One Using The Container Ip

### 1. Run Your Application Container

Ensure your application is running inside a container and listening on a specific port (e.g., `http://container-ip:5000`). You can verify this by running:

```
docker ps
docker inspect <container-name> | grep "IPAddress"
```

If using Docker Compose, you can reference the service name instead of the IP address.

### 2. Modify NGINX Configuration

Update your NGINX configuration file (`/etc/nginx/sites-available/default` or `/etc/nginx/nginx.conf`) to define the reverse proxy.

#### Example Configuration:

```
server {
    listen 80;
    server_name localhost; ## can be domain or ip

    location /hello/ {
        proxy_pass http://container-ip:port/; # can also be the domain and ip
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    }
}
```

#### Explanation:
- `proxy_pass http://container-ip:5000/;` → Routes requests from `this.ir/hello/` to your container.
- `proxy_set_header Host $host;` → Maintains the original `Host` header.
- `proxy_set_header X-Real-IP $remote_addr;` → Passes the real client IP to the backend.
- `proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;` → Retains the chain of client IPs for logging and debugging.

### 3. Restart NGINX

Test the new config 

```
nginx -t
```

Apply the new configuration by restarting NGINX:

```
sudo systemctl restart nginx
```

Check if NGINX is running without errors:

```
sudo systemctl status nginx
```

## same shit with Https redirect must come here!!!!


## Way Two Using Docker Compose

If you want to run both NGINX and your application in a single `docker-compose.yml`, define the services as follows:

### Example `docker-compose.yml`:

```yaml
version: "3"
services:
  my-app:
    image: my-app-image
    container_name: my-app
    ports:
      - "5000:5000"

  nginx:
    image: nginx
    container_name: my-nginx
    volumes:
      - ./nginx.conf:/etc/nginx/nginx.conf
    ports:
      - "80:80"
    depends_on:
      - my-app
```

### Example `nginx.conf`:

```nginx
server {
    listen 80;
    server_name this.ir;

    location /hello/ {
        proxy_pass http://my-app:5000/;
    }
}
```

### Running the Setup:

```sh
docker-compose up -d
```

## Additional Considerations

### Handling Dynamic Container IPs

If your container IP changes frequently, it's best to use:
- Docker Compose service names (e.g., `my-app`) instead of IP addresses.
- `proxy_pass http://my-app:5000/;` instead of `proxy_pass http://container-ip:5000/;`.

### Debugging Issues

Check NGINX logs for errors:

```sh
sudo tail -f /var/log/nginx/error.log
```

Check if NGINX is correctly forwarding requests:

```sh
curl -v http://this.ir/hello/
```

## Conclusion

✅ This setup ensures requests to `this.ir/hello/` are correctly proxied to your containerized application.
✅ Works with both standalone NGINX and Docker Compose.
✅ Using service names instead of IPs makes the setup more flexible and robust.
