FROM debian:stretch-slim

COPY ./source/debian_script.sh /tmp/
RUN /tmp/debian_script.sh

COPY ./source/image_script.sh /tmp/
COPY ./source/*_subscript.sh /tmp/
RUN /tmp/image_script.sh

COPY ./source/docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/bin/bash"]
