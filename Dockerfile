FROM alpine:3.18

RUN apk add --no-cache unzip ca-certificates libc6-compat

WORKDIR /app

# Copy your PocketBase ZIP from the repo
COPY pocketbase.zip /app/pocketbase.zip

# Unzip the PocketBase binary and make it executable
RUN unzip pocketbase.zip && \
    chmod +x pocketbase && \
    rm pocketbase.zip

# PocketBase runs on port 8090
EXPOSE 8090

# Start PocketBase server
CMD ["/app/pocketbase", "serve", "--http=0.0.0.0:8090"]
