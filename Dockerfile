FROM alpine:3.18

# Install dependencies
RUN apk add --no-cache libc6-compat

# Work directory
WORKDIR /app

# Copy PocketBase binary & migration folder
COPY pocketbase /app/pocketbase
COPY pb_migrations /app/pb_migrations

# Allow execution
RUN chmod +x /app/pocketbase

# Expose port
EXPOSE 8090

# Run PocketBase server
CMD ["/app/pocketbase", "serve", "--http=0.0.0.0:8090"]
