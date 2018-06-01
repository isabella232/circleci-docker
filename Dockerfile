FROM docker:18.03.0-git

RUN set -e; \
    apk add --no-cache \
		bash \
		curl \
		wget \
		grep \
		python3; \
	python3 -m ensurepip; \
	rm -r /usr/lib/python*/ensurepip; \
	pip3 install --upgrade pip docker-compose setuptools pyinstaller; \
	rm -r /root/.cache; \
	cd /tmp; \
	git clone https://github.com/sstephenson/bats.git; \
	cd ./bats; \
    ./install.sh /usr/local;

CMD ["bash"]
