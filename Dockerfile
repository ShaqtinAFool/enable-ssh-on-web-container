FROM nginx:1.23.4-alpine
LABEL maintainer="tony"

# Initial
COPY index.html /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY entrypoint.sh /root
RUN chmod +x /root/entrypoint.sh

# Install package
RUN apk update \
    && apk add vim \
    && apk add bash \
    && apk add busybox-extras \
    && apk add dialog \
    && apk add openssh \
    && apk add openrc

# Start and enable SSH
RUN echo "root:Docker!" | chpasswd \
    && cd /etc/ssh/ \
    && ssh-keygen -A
COPY sshd_config /etc/ssh/

EXPOSE 2222

ENTRYPOINT ["/root/entrypoint.sh"]