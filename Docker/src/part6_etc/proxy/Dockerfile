FROM nginx:latest

WORKDIR /

RUN apt-get update && apt-get install -y \
    gcc \
    libfcgi-dev \
    spawn-fcgi \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN chmod 777 /var/cache/nginx/ /var/run/

COPY ./nginx.conf /etc/nginx/
COPY ./main.sh /etc/nginx/

RUN usermod -aG root,gnats,daemon,disk,sudo nginx \
    && chmod +x /etc/nginx/main.sh

USER nginx

CMD ["/etc/nginx/main.sh"]
