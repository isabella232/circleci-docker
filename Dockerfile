FROM docker:18.03.0-git

RUN apk add --no-cache \
		bash \
		curl \
		wget \
		grep \
		py-pip && \
	pip install docker-compose

CMD ["bash"]