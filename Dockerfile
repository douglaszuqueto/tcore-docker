FROM alpine

WORKDIR /app

RUN apk add --no-cache libstdc++

RUN wget https://downloads.tagocore.com/v0.4.1/tagocore-v0.4.1-alpine-x64.tar.gz && \
    tar -xzf tagocore-v0.4.1-alpine-x64.tar.gz && \
    rm tagocore-v0.4.1-alpine-x64.tar.gz

COPY docker-entrypoint.sh .

RUN chmod +x ./docker-entrypoint.sh
RUN chmod +x ./tagocore

EXPOSE 8888

ENTRYPOINT [ "./docker-entrypoint.sh" ]
