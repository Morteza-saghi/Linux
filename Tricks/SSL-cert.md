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
