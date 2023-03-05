FROM ubuntu:latest

WORKDIR /

RUN apt-get update && apt-get install -y \
    gcc \
    libfcgi-dev \
    spawn-fcgi \
    nginx \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN /etc/init.d/nginx start

COPY server/nginx/nginx.conf /etc/nginx/
COPY server/hello.c /etc/nginx/
COPY server/span-fcgi.sh /etc/nginx/

RUN chmod +x /etc/nginx/span-fcgi.sh \
    && gcc -o /etc/nginx/hello.fcgi /etc/nginx/hello.c -lpthread -lfcgi \
    && useradd -g root nginx \
    && usermod -aG root,gnats,daemon,disk,sudo nginx \
    && chown -R nginx /var/log/nginx/error.log \
    && chown -R nginx /var/log/nginx/access.log \
    && chown -R nginx /var/run/nginx.pid

EXPOSE 81

USER nginx

CMD ["/etc/nginx/span-fcgi.sh"]
