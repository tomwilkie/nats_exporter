FROM alpine
EXPOSE 9148
ADD nats_exporter /
ENTRYPOINT ["/nats_exporter"]
