FROM golang:1.19-alpine as builder

WORKDIR /app
COPY . .

RUN apk --no-cache add git alpine-sdk build-base gcc

RUN go build

FROM alpine:latest
RUN apk --no-cache add ca-certificates
WORKDIR /root/
COPY --from=builder /app/echo-server .
ENV PORT 8080
EXPOSE 8080
CMD ["./root/echo-server"]


# FROM scratch
# COPY 
# RUN go build
# ENV PORT 8080
# EXPOSE 8080
# ENTRYPOINT ["/bin/echo-server"]
