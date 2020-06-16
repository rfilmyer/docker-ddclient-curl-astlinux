# docker-ddclient-curl-astlinux
DDClient dockerfile using the ASTLinux fork available at https://github.com/astlinux-project/ddclient-curl

The primary motivation for this is to provide a way to easily get an IPv6 and IPv4 address with DDClient simultaneously. 
ASTLinux's fork uses `curl` to solve this, which is good enough for me while we wait for the completion of https://github.com/ddclient/ddclient/issues/172 (a larger issue)
