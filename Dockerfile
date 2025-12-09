FROM alpine:3.18

RUN apk add --no-cache unzip ca-certificates libc6-compat

WORKDIR /app

COPY pocketbase.zip /app/pocketbase.zip

RUN unzip pocketbase.zip && \
    chmod +x pocketbase && \
    rm pocketbase.zip

EXPOSE 8090

CMD ["/app/pocketbase", "serve", "--http=0.0.0.0:8090"]
