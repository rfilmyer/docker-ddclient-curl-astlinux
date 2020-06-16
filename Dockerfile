FROM perl

label version="3.8.3-06-devel"

RUN \
  echo "Installing Dependencies..."                    \
  && apk add --no-cache --virtual=build-dependencies   \
      curl             \
      tar              \
      wget             \
  && apk add --no-cache --virtual=build-dependencies   \
      iproute2         \
      perl-json        \
      perl-digest-sha1 \
  && echo "Installing DDClient"                        \
  && curl -o /tmp/ddclient-curl.tar.gz                 \
    -L "https://github.com/astlinux-project/ddclient-curl/archive/master.tar.gz" \
  && mkdir -p /tmp/ddclient \
  && tar xf /tmp/ddclient-curl.tar.gz -C /tmp/ddclient \
  && cp /tmp/ddclient/ddclient /usr/bin/ddclient \
  && cp /tmp/ddclient/get-ipv6-from-ipv4 /usr/bin/     \
  && echo "Cleaning Up..." \
  && rm -rf /tmp/*

CMD ["ddclient"]
VOLUME /config