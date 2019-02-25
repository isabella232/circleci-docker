FROM debian:stretch-slim

COPY ./source/debian_script.sh /tmp/
RUN /tmp/debian_script.sh

COPY ./source/docker_script.sh /tmp/
RUN /tmp/docker_script.sh

COPY ./source/aws_script.sh /tmp/
RUN /tmp/aws_script.sh

COPY ./source/kubernetes_script.sh /tmp/
RUN /tmp/kubernetes_script.sh

COPY ./source/docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/bin/bash"]
