# First stage: create index.html
FROM alpine:latest AS builder
RUN echo "<p> Hello World </p>" > /index.html

# Final stage: use nginx and index.html
FROM nginx:latest
COPY --from=builder /index.html /usr/share/nginx/html/index.html
CMD echo "Starting nginx..." && nginx -g 'daemon off;'
