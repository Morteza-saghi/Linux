# Nginx 

## Serving Static Files

To serve static files in Nginx, you need to configure the `/etc/nginx/nginx.conf` file. This is where the core configurations are made.

### Basic Configuration Example

The following is a simple configuration to serve static files:

```
http {
    server {
        listen 8080;                 # Port to serve the content
        root /saghi/;                # Directory where the content is located
    }
}

events {}
```

---

root: Defines the directory where the static files are located.

listen: Specifies the port on which Nginx will listen for incoming requests.

---

### Enabling MIME Types

MIME types allow Nginx to serve different types of content (e.g., HTML, CSS, JS). To include them, we need to add the mime.types file.
Configuration Example with MIME Types

```
http {
    include mime.types;              # Include MIME types for serving various file types

    server {
        listen 8080;
        root /saghi/;
    }
}

events {}
```

include mime.types: Ensures that Nginx can serve different file types like .css, .js, etc., alongside the HTML files.

---

## Using Location Blocks
### Handling Different Paths

If you want to serve content from different paths within your website, Nginx uses location blocks to map URLs to directories.
Example

```
http {
    server {
        listen 8080;
        root /saghi/;                # The default directory for files, e.g., index.html

        location /salam {
            root /saghi/;            # Serve content from the /saghi/ directory when accessing /salam
        }
    }
}

events {}
```

---

location /salam: This block serves files from /saghi/ when the URL /salam is accessed.
Nginx looks for index.html or a similar default file in the specified directory when serving content.

---

- Important Note

When you define a location block like this:

```
location /PathName {
    root /saghi/;
}
```

Nginx appends /PathName to the root path. So if you request /PathName, it will look for content in /saghi/PathName.
Using Aliases for Custom Paths

When you want to serve a file from a different directory, and you don't want Nginx to append the path from the URL, you can use alias.


Example

```
http {
    server {
        listen 8080;
        root /saghi/;

        location /salam {
            root /saghi/;
        }

        location /hello {
            alias /saghi/salam;      # "alias" does not append the URL path
        }
    }
}

events {}
```

---
- alias /saghi/salam: This serves content directly from /saghi/salam when the /hello URL is accessed, without appending /hello to the path.
---

### Using try_files for Fallback Content

The try_files directive allows you to specify fallback behavior if a file is not found. This is useful for custom error handling, redirects, or when serving content from multiple locations.
Example with try_files

```
http {
    server {
        listen 8080;
        root /saghi/;

        location / {
            try_files $uri $uri/ =404;    # Try the requested URI, then URI/, or return a 404 error
        }

        location /images/ {
            try_files $uri /fallback.jpg; # If the requested image is not found, serve fallback.jpg
        }
    }
}

events {}
```

---

try_files $uri $uri/ =404: This tries to serve the exact file or directory requested by the user, or returns a 404 if neither exists.

try_files $uri /fallback.jpg: In this example, if an image is not found, Nginx serves fallback.jpg instead.

---
