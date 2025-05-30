# Use Nginx to serve static content
FROM nginx:stable-alpine

# Remove default config
RUN rm /etc/nginx/conf.d/default.conf

# Add custom config
COPY nginx.conf /etc/nginx/conf.d

# Copy HTML content
COPY index.html /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
