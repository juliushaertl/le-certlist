# le-certlist

This is a collection of shell scripts to automate the process of let's encrypt
certificate creation and renewal using `acme_tiny` (a 200 line python acme
client).

All scripts are using a simple text file containing a list of domain names.

- `le-certlist-setup` setup basic directories and let's encrypt account key
- `le-certlist-apache` write existing apache https configuration to certlist file
- `le-certlist-generate` generate private keys, csr and request a certificate
- `le-certlist-renewal` renew all certificates that expire in less than 30 days

Requirements: openssl, wget, python, acme-tiny.py in PATH
