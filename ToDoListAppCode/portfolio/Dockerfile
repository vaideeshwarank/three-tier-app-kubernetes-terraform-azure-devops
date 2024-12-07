# Dockerfile for the Portfolio using Nginx
FROM nginx:alpine

# Copy website files to the Nginx HTML directory
COPY . /usr/share/nginx/html

# Expose port 80 for web traffic
EXPOSE 80

# Start Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
