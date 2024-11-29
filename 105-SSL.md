# Certbot Renewal Setup

Your current setup uses Certbot's `--manual` plugin with DNS-based challenges, which requires manual interaction or scripts to complete the process. To streamline the renewal of your certificates, you can either automate the DNS validation using a plugin that supports your DNS provider or transition to a different challenge type. Here's how:

## 1. Renew with Manual DNS Challenge

If you wish to renew using the same manual process:

Run the following command:

```
sudo certbot certonly --manual --preferred-challenges=dns --email <your-email> --server https://acme-v02.api.letsencrypt.org/directory --agree-tos --key-type rsa -d example.com -d *.example.com
```
#### Certbot will prompt you to create TXT DNS records. You need to:
- Log in to your DNS provider's management console.
- Add the TXT record(s) as specified by Certbot.


Once the TXT records are propagated (it may take a few minutes), Certbot will validate and renew the certificates.

---

Reload the web server to apply the renewed certificates:

```
sudo nginx -s reload
```

---


## 2. Automate DNS Challenge with a Plugin
To automate the renewal, use a DNS plugin compatible with your DNS provider.

Install a DNS Plugin
For example, if you're using Cloudflare:

Install the plugin:

```
sudo apt install python3-certbot-dns-cloudflare
```


---


Create a credentials file for Cloudflare:

```
sudo nano /etc/letsencrypt/cloudflare.ini
```


---


Add the following:

```
dns_cloudflare_api_token = <your-cloudflare-api-token>
```


---


Ensure the file is secure:

```
sudo chmod 600 /etc/letsencrypt/cloudflare.ini
```


---


Run Certbot with the Plugin

```
sudo certbot certonly --dns-cloudflare --dns-cloudflare-credentials /etc/letsencrypt/cloudflare.ini -d example.com -d *.example.com
```


---


#### Schedule Automatic Renewal
Certbot automatically renews certificates with compatible DNS plugins. Test renewal with:

```
certbot renew --dry-run
```
