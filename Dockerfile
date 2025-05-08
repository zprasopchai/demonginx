# Use the official NGINX image from Docker Hub
FROM nginx:latest

COPY index.html /usr/share/nginx/html/
COPY ./nginx/conf.d/ /etc/nginx/conf.d/

# Fix permissions on actual nginx html root
RUN chmod -R 755 /usr/share/nginx/html && \
    chown -R nginx:nginx /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]