# Use the official NGINX image from Docker Hub
FROM nginx:latest

COPY index.html /usr/share/nginx/html/

COPY ./nginx/conf.d/ /etc/nginx/conf.d/

RUN chmod -R 755 /var/www/html && \
    chown -R nginx:nginx /var/www/html
# Expose port 80 to the outside world
EXPOSE 80

# Command to start NGINX when the container starts
CMD ["nginx", "-g", "daemon off;"]




