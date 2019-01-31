FROM alpine

ARG ARCH
COPY qemu-${ARCH}-static /usr/bin

RUN uname -ar > /uname.build
