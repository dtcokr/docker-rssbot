# 
# Build
#
FROM ekidd/rust-musl-builder AS builder

# Edit here to change the update interval, default 300 seconds(5 minutes).
ARG INTVL="300"

RUN git clone --depth 1 https://github.com/iovxw/rssbot.git . \
  && sed -i "s/unwrap_or(300)/unwrap_or(${INTVL})/" ./src/main.rs \
  && sudo chown -R rust:rust /home/rust \
  && rustup target add x86_64-unknown-linux-musl \
  && cargo build --release

# 
# Run
# 
FROM alpine:latest
LABEL maintainer "dtcokr <dtcokr@outlook.com>"

COPY --from=builder /home/rust/src/target/x86_64-unknown-linux-musl/release/rssbot \
    /usr/local/bin/
COPY start.sh /etc/start.sh

ENV DF="/rss/data.json"
ENV TK=""
ENV INTVL="300"

RUN apk --no-cache add ca-certificates \
  && chmod +x /etc/start.sh

VOLUME /rss
WORKDIR /rss

ENTRYPOINT ["/etc/start.sh"]
