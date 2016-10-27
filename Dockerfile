FROM swiftdocker/swift
MAINTAINER Ian Grossberg <ian@poursteady.com>

RUN mkdir -p /opt/app

WORKDIR /opt/app
ADD . /opt/app
RUN swift build
