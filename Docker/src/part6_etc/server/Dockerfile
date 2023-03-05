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
COPY ./hello.c /etc/nginx/
COPY ./span-fcgi.sh /etc/nginx/

RUN chmod +x /etc/nginx/span-fcgi.sh \
    && gcc -o /etc/nginx/hello.fcgi /etc/nginx/hello.c -lpthread -lfcgi \
    && usermod -aG root,gnats,daemon,disk,sudo nginx

USER nginx

CMD ["/etc/nginx/span-fcgi.sh"]
