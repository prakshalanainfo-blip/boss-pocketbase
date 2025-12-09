FROM alpine:3.18

# Install unzip + SSL certificates
RUN apk add --no-cache unzip ca-certificates libc6-compat

WORKDIR /app

# Copy zipped PocketBase
COPY pocketbase.zip /app/pocketbase.zip

# Unzip PocketBase and set execute permission
RUN unzip pocketbase.zip && \
    chmod +x pocketbase && \
    rm pocketbase.zip

# Copy optional data folders (if available)
COPY pb_data /app/pb_data
COPY pb_migrations /app/pb_migrations

EXPOSE 8090

# Run PocketBase server
CMD ["/app/pocketbase", "serve", "--http=0.0.0.0:8090"]
