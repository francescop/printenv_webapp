FROM golang:alpine3.15 AS build

WORKDIR /app

COPY go.mod ./

COPY *.go ./

RUN go build -o /printenv

FROM alpine:3.15.0

WORKDIR /

COPY --from=build /printenv /printenv

CMD ["/printenv"]
