## Obtain SSL Certificate

### Let's Encrypt


#### Install Certbot:
```
apt update
apt install certbot python3-certbot-nginx
```

### Generate a certificate for your subdomain
```
certbot certonly --manual --preferred-challenges=dns --email <theemail> --server https://acme-v02.api.letsencrypt.org/directory --agree-tos --key-type rsa -d <thedomain> -d <the sunbdomin using wildcard *.domain.ir>
```
- fill the needed parts

the certs are made in this directory 

```
cd /etc/letsencrypt/archive
```

 what i do is this 

```
tar -czvf filename.tar.gz filename.ir
chown user:user filename #give access to needed user
tar -xzvf filename.tar.gz
```

### im using the nginx so i did the redirections and force https and the location of the certs for my nginx.conf file 

#### this is where the file is located 

```
nano /etc/nginx/nginx.conf
```

#### here is the file to have a inpration 
- to have a better undrestanding i have 3 subdomain and all 3 are containers listening on difrent ports


```
http {
    # HTTP server block - Redirect HTTP to HTTPS for domain1.com
    server {
        listen 80;
        server_name domain1.com;
        return 301 https://$host$request_uri;  # Redirect all traffic to HTTPS
    }

    # HTTPS server block for domain1.com
    server {
        listen 443 ssl http2;
        server_name domain1.com;

        ssl_certificate /etc/letsencrypt/live/domain1.com/fullchain.pem;
        ssl_certificate_key /etc/letsencrypt/live/domain1.com/privkey.pem;
        ssl_trusted_certificate /etc/letsencrypt/live/domain1.com/chain.pem;

        ssl_protocols TLSv1.2 TLSv1.3;
        ssl_ciphers HIGH:!aNULL:!MD5;
        ssl_prefer_server_ciphers on;

        location / {
            proxy_pass http://127.0.0.1:8080;  # Adjust the backend service port as needed
            proxy_set_header Host $host;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header X-Forwarded-Proto $scheme;
        }
    }

    # HTTP server block - Redirect HTTP to HTTPS for domain2.com
    server {
        listen 80;
        server_name domain2.com;
        return 301 https://$host$request_uri;  # Redirect all traffic to HTTPS
    }

    # HTTPS server block for domain2.com
    server {
        listen 443 ssl http2;
        server_name domain2.com;

        ssl_certificate /etc/letsencrypt/live/domain2.com/fullchain.pem;
        ssl_certificate_key /etc/letsencrypt/live/domain2.com/privkey.pem;
        ssl_trusted_certificate /etc/letsencrypt/live/domain2.com/chain.pem;

        ssl_protocols TLSv1.2 TLSv1.3;
        ssl_ciphers HIGH:!aNULL:!MD5;
        ssl_prefer_server_ciphers on;

        location / {
            proxy_pass http://127.0.0.1:8081;  # Adjust the backend service port as needed
            proxy_set_header Host $host;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header X-Forwarded-Proto $scheme;
        }
    }

    # HTTP server block - Redirect HTTP to HTTPS for domain3.com
    server {
        listen 80;
        server_name domain3.com;
        return 301 https://$host$request_uri;  # Redirect all traffic to HTTPS
    }

    # HTTPS server block for domain3.com
    server {
        listen 443 ssl http2;
        server_name domain3.com;

        ssl_certificate /etc/letsencrypt/live/domain3.com/fullchain.pem;
        ssl_certificate_key /etc/letsencrypt/live/domain3.com/privkey.pem;
        ssl_trusted_certificate /etc/letsencrypt/live/domain3.com/chain.pem;

        ssl_protocols TLSv1.2 TLSv1.3;
        ssl_ciphers HIGH:!aNULL:!MD5;
        ssl_prefer_server_ciphers on;

        location / {
            proxy_pass http://127.0.0.1:9090;  # Adjust the backend service port as needed
            proxy_set_header Host $host;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header X-Forwarded-Proto $scheme;
        }
    }
}

events {}

```

- ps: if u need a p12 file for someplace here is the commnad 


```
openssl pkcs12 -export -out <DomainName>.p12 -inkey privkey.pem -in fullchain.pem
``` 


