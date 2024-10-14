# NGINX Configuration for Directory Listing with SSL and Basic Authentication

> **Note:** For detailed information on setting up Basic Authentication, refer to the `nginx-102-auth.md` document in the same directory.

## Server Configuration Overview

This guide covers:
- Redirecting HTTP traffic to HTTPS.
- Enabling SSL with HTTP/2 for the domain.
- Serving files from a specified directory and enabling directory listing.
- Protecting the directory with basic authentication.

## Configuration File

Below is the full NGINX configuration file:

```
HTTP server block - Redirect HTTP to HTTPS

server { listen 80; server_name yourdomain.com; return 301 https://$host$request_uri; # Redirect all traffic to HTTPS }
HTTPS server block with Basic Authentication

server { listen 443 ssl http2; root /var/www/html/shit/; server_name yourdomain.com;

# Enable directory listing
autoindex on;

# SSL certificates
ssl_certificate /etc/letsencrypt/live/yourdomain.com/fullchain.pem;
ssl_certificate_key /etc/letsencrypt/live/yourdomain.com/privkey.pem;
ssl_trusted_certificate /etc/letsencrypt/live/yourdomain.com/chain.pem;

# SSL settings
ssl_protocols TLSv1.2 TLSv1.3;
ssl_ciphers HIGH:!aNULL:!MD5;
ssl_prefer_server_ciphers on;

# Enable Basic Authentication
auth_basic "Restricted Access";
auth_basic_user_file /etc/nginx/.htpasswd;  # Path to the .htpasswd file

# Main location block for serving files
location / {
    try_files $uri $uri/ =404;  # Serve files or 404 if not found
}

}

```
---

### Explanation of Key Directives

- `autoindex on;`: Enables directory listing. When no `index.html` file is present, NGINX will list the contents of the directory.
  
- `ssl_certificate`, `ssl_certificate_key`, and `ssl_trusted_certificate`: Specifies the paths to the SSL certificates for HTTPS. These should be updated with the correct paths from your Let's Encrypt or other certificate authority setup.

- `ssl_protocols` and `ssl_ciphers`: Configures the accepted SSL protocols and ciphers for secure communication. TLSv1.2 and TLSv1.3 are set, along with strong ciphers.

- `auth_basic` and `auth_basic_user_file`: Implements Basic Authentication. For detailed steps on setting up Basic Authentication, refer to the `nginx-102-auth.md` file.

- `try_files $uri $uri/ =404;`: Instructs NGINX to first attempt serving the requested file, then try the directory (if it's a directory request), and finally return a 404 if neither exists.

---

## File and Directory Permissions

#### Ensure NGINX has the proper permissions to access the directory and its contents:

```
sudo chown -R www-data
/var/www/html/shit/ sudo chmod -R 755 /var/www/html/shit/
```

#### Make sure the `.htpasswd` file for Basic Authentication is correctly set up:

```
htpasswd -c /etc/nginx/.htpasswd your_username
```

---

## Restarting NGINX

### After testing the  changes to the configuration

```
nginx -t
```

### reload NGINX to apply them:

```
nginx -s reload
```

---

By following this configuration, you can serve files from the `/var/www/html/shit/` directory, enable SSL with HTTP/2, list the directory contents, and protect access with Basic Authentication.
