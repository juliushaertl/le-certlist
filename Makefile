default:
	@echo "Run make install to copy files to /usr/local/[s]bin"
install:
	wget https://raw.githubusercontent.com/diafygi/acme-tiny/master/acme_tiny.py
	chmod +x acme_tiny.py
	mv acme_tiny.py /usr/local/bin
	cp ./le-certlist-apache /usr/local/sbin
	cp ./le-certlist-generate /usr/local/sbin
	cp ./le-certlist-renewal /usr/local/sbin
	cp ./le-certlist-setup /usr/local/sbin
