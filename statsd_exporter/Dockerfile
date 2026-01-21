FROM alpine:3.19

WORKDIR /opt/statsd_exporter

COPY statsd_exporter-0.28.0.linux-amd64.tar.gz /tmp/

RUN tar -xzf /tmp/statsd_exporter-0.28.0.linux-amd64.tar.gz -C /tmp \
    && mv /tmp/statsd_exporter-0.28.0.linux-amd64/statsd_exporter /usr/local/bin/ \
    && chmod +x /usr/local/bin/statsd_exporter \
    && rm -rf /tmp/*

EXPOSE 9102
EXPOSE 8125/udp

ENTRYPOINT ["statsd_exporter"]
