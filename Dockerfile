FROM debian
MAINTAINER Voronina Ekaterina <voronina2511@yandex.ru>
ADD debian.list /etc/apt/sources.list.d/
RUN apt-get update && \
    apt-get -y upgrade && \
    apt -y install nginx && \
    apt-get clean && \
    rm -rf /var/www/* && \ 
    mkdir -p /var/www/kawa.com/img && \
    chmod -R 754 /var/www/kawa.com/ && \
    useradd admin && \
    usermod -aG admin admin && \
    chown -R admin:admin /var/www/kawa.com/ && \
    sed -i 's/\/var\/www\/html/\/var\/www\/kawa.com/g' /etc/nginx/sites-enabled/default && \
    sed -i 's/user www-data/user admin/g' /etc/nginx/nginx.conf
ADD index.html /var/www/kawa.com/
ADD img.jpg /var/www/kawa.com/img/
CMD ["nginx", "-g", "daemon off;"]
