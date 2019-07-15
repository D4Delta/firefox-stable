FROM bitnami/minideb:latest
LABEL maintainer "Delta - https://github.com/D4Delta"
ENTRYPOINT ["/app/firefox/firefox"]
RUN useradd -u 10000 -c "Firefox unprivileged user" -g nogroup -m -p "$(base64 /dev/urandom | head -n 1)" -s /sbin/nologin firefox
RUN install_packages libpulse0 wget ca-certificates bzip2 libgtk-3-0 libdbus-glib-1-2 libxt6

RUN mkdir /app
RUN wget -O /app/firefox.tar.bz2 'https://download.mozilla.org/?product=firefox-latest-ssl&os=linux64&lang=en-US'
RUN cd /app && tar xvf firefox.tar.bz2
RUN chmod o=rx /app
RUN chmod -R o=rx /app/firefox
RUN rm /app/firefox.tar.bz2

USER firefox

