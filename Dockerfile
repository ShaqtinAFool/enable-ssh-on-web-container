FROM nginx:1.23.4-alpine
LABEL maintainer="tony"

COPY index.html /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY entrypoint.sh /
COPY sshd_config /etc/ssh/

# Start and enable SSH
RUN apk update \
    && apk add vim \
    && apk add bash \
    && apk add busybox-extras \
    && apk add dialog \
    && apk add openssh \
    && apk add python3 \
    && apk add py3-pip \
    && apk add openrc \
    # && apk add gunicorn \
    && echo "root:Docker!" | chpasswd \
    && chmod +x entrypoint.sh \
    && cd /etc/ssh/ \
    && ssh-keygen -A

ENTRYPOINT ["/entrypoint.sh"]
EXPOSE 2222