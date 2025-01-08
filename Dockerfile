# Use the official NGINX image from Docker Hub
FROM nginx:latest

COPY index.html /usr/share/nginx/html/

# Expose port 80 to the outside world
EXPOSE 80

# Command to start NGINX when the container starts
CMD ["nginx", "-g", "daemon off;"]




