
# Pull the minimal Ubuntu image
FROM debian:bullseye
# Install Nginx
RUN apt-get -y update && \
    apt-get -y install nginx && \
    apt-get -y install openssl

# Copy the Nginx config
COPY /conf/nginx.conf /etc/nginx/sites-available/default

# Expose the port for access
EXPOSE 443/tcp

# Run the Nginx server
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]

RUN openssl req -subj '/CN=localhost' -x509 -newkey rsa:4096 -nodes -keyout /etc/ssl/certs/key.pem -out /etc/ssl/certs/fullchain.pem -days 365
