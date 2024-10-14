# Basic Authentication in NGINX

## Steps to Set Up Basic Authentication

### 1. Create the `.htpasswd` File

The `.htpasswd` file stores the credentials (username and password) for authentication. You can generate this file using the `htpasswd` command.

To install `htpasswd` if not available:

- **Debian/Ubuntu**:
```
sudo apt-get install apache2-utils
```
Then, create the .htpasswd file with a username (e.g., user1):

```
htpasswd -c /etc/nginx/.htpasswd user1
```
You will be prompted to enter and confirm a password. This will create a file at /etc/nginx/.htpasswd containing the username and an encrypted version of the password.

2. Modify the NGINX Configuration
Next, update your NGINX configuration to enable basic authentication for the desired server block. The authentication is added using the auth_basic and auth_basic_user_file directives.

An example of the NGINX server block with basic authentication:

```
server {
    listen 443 ssl http2;
    server_name yourdomain.com;

    ssl_certificate /etc/letsencrypt/live/yourdomain.com/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/yourdomain.com/privkey.pem;

    ssl_protocols TLSv1.2 TLSv1.3;
    ssl_ciphers HIGH:!aNULL:!MD5;
    ssl_prefer_server_ciphers on;

    # Enable Basic Authentication
    auth_basic "Restricted Area";
    auth_basic_user_file /etc/nginx/.htpasswd;

    location / {
        proxy_pass http://127.0.0.1:9090;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}
```

Explanation of Authentication Directives:

- auth_basic "Restricted Area";: This directive enables basic authentication and defines the message (Restricted Area) shown in the authentication prompt.
- auth_basic_user_file /etc/nginx/.htpasswd;: This directive specifies the path to the .htpasswd file, which contains the usernames and passwords for authentication.



3. Test the NGINX Configuration
After modifying the configuration, check if the syntax is correct:

```
nginx -t
```

If there are no errors, reload NGINX to apply the changes:

```
systemctl reload nginx
```

4. Verify Authentication
Now, when users attempt to access the site, they will be prompted to enter a username and password. Only those with valid credentials (stored in the .htpasswd file) will be allowed access.


- To ensure all traffic uses HTTPS, you can add a server block to redirect HTTP traffic to HTTPS:

```
server {
    listen 80;
    server_name yourdomain.com;
    return 301 https://$host$request_uri;
}
```

- This forces all HTTP requests to be redirected to HTTPS, ensuring a secure connection.

---
