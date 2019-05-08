FROM nginx:1.13.8

EXPOSE 8080

COPY entrypoint.sh /root/
ENTRYPOINT ["/root/entrypoint.sh"]

COPY default.conf.template /etc/nginx/conf.d/default.conf.template
COPY static /usr/share/nginx/html
