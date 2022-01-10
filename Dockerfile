FROM golang:1.16-buster AS build

WORKDIR /app

COPY go.mod ./

COPY *.go ./

RUN go build -o /printenv

FROM gcr.io/distroless/base-debian10

WORKDIR /

COPY --from=build /printenv /printenv

USER nonroot:nonroot

CMD ["/printenv"]
