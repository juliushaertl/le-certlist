# le-certlist

This is a collection of shell scripts to automate the process of let's encrypt
certificate creation and renewal using [acme_tiny](https://github.com/diafygi/acme-tiny) (a 200 line python acme
client).

All scripts are using a simple text file containing a list of domain names.

- `le-certlist-setup` setup basic directories and let's encrypt account key
- `le-certlist-apache` write existing apache https configuration to certlist file
- `le-certlist-generate` generate private keys, csr and request a certificate
- `le-certlist-renewal` renew all certificates that expire in less than 30 days

Requirements: openssl, wget, python, `acme_tiny.py` in PATH

By now this is just tested on Debian jessie.

## Getting started

1. Run the setup script to create folders and account key `./le-certlist-setup`.
2. Create /etc/le-certlist/certlist manually or using `./le-certlist-apache`.
3. Setup your webserver to provide `/.well-known/acme-challenge/` from `/var/www/challenges`.
4. Run `./le-certlist-generate` to create private keys, csr and request your first certificate.
5. Run `./le-certlist-renewal` to check for expiring certificates and renew them automatically.

## File format

Example /etc/le-certlist/certlist for creating two certificates with 3 domains each:

```
maindomain.com alias1.com alias2.com
2nddomain.com example.com other.com
```
 


## Setup Apache for acme challenge serving

Add this to your apache configuration:

```
Alias /.well-known/acme-challenge/ /var/www/challenges/
<Directory /var/www/challenges/>
    Bypass Auth
</Directory>
RewriteCond %{REQUEST_URI} /\.well\-known/acme\-challenge/
RewriteRule (.*) /.well-known/acme-challenge/$1 [L,QSA]
```
