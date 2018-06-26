FROM fedora:latest
RUN dnf install -y make rpm-build 'dnf-command(builddep)'
ADD . /build
WORKDIR /build
RUN make srpm
RUN dnf builddep -y ./bazel-*.src.rpm
RUN make rpm
