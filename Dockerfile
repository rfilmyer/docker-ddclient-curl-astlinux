FROM alpine

label version="3.8.3-06-devel"

RUN \
  echo "Installing Dependencies..."                    \
  && apk add --no-cache --virtual=build-dependencies   \
      curl             \
      tar              \
      wget             \
      perl             \
      iproute2         \
      perl-json        \
      perl-digest-sha1 \
  && echo "Installing DDClient"                        \
  && curl -o /tmp/ddclient-curl.tar.gz                 \
    -L "https://github.com/astlinux-project/ddclient-curl/archive/master.tar.gz" \
  && mkdir -p /tmp/ddclient \
  && tar xf /tmp/ddclient-curl.tar.gz -C /tmp/         \
  && cp /tmp/ddclient-curl-master/ddclient             \
        /usr/bin/ddclient                              \
  && cp /tmp/ddclient-curl-master/contrib/get-ipv6-from-ipv4/get-ipv6-from-ipv4.pl       \
        /usr/bin/                                      \
  && echo "Cleaning Up..."                             \
  && rm -rf /tmp/*

CMD ["ddclient"]
VOLUME /config