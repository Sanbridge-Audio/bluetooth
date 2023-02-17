# Use a multi-stage build to compile bluez
FROM debian:buster-slim AS build

RUN apt-get update && apt-get install -y \
    build-essential \
    libdbus-1-dev \
    libglib2.0-dev \
    libudev-dev \
    libical-dev \
    libreadline-dev \
    wget

WORKDIR /tmp
RUN wget https://mirrors.edge.kernel.org/pub/linux/bluetooth/bluez-5.62.tar.xz \
    && tar -xvf bluez-5.62.tar.xz \
    && cd bluez-5.62 \
    && ./configure --prefix=/usr --mandir=/usr/share/man --sysconfdir=/etc --localstatedir=/var --enable-experimental \
    && make \
    && make install

# Create a new debian container and copy the compiled bluez binaries
FROM debian:buster-slim
COPY --from=build /usr/libexec/bluetooth/bluetoothd /usr/libexec/bluetooth/
COPY --from=build /usr/bin/bluetoothctl /usr/bin/
COPY --from=build /usr/bin/hciattach /usr/bin/
COPY --from=build /usr/bin/hciconfig /usr/bin/
COPY --from=build /usr/bin/hcidump /usr/bin/
COPY --from=build /usr/bin/hcitool /usr/bin/
COPY --from=build /usr/bin/rfcomm /usr/bin/
COPY --from=build /usr/share/dbus-1/system-services/org.bluez.service /usr/share/dbus-1/system-services/
COPY --from=build /usr/share/dbus-1/system.d/bluetooth.conf /usr/share/dbus-1/system.d/

CMD ["bluetoothd", "-d"]

