FROM ubuntu:24.04

ENV DEBIAN_FRONTEND noninteractive

# Install dependencies
RUN apt-get update && \
    apt-get install -y python3 python3-pip \
    python3-clang python3-autopep8 clang llvm gcc-mingw-w64

RUN mkdir /app
COPY ctypesgen.py /app
COPY run_tests.sh /app
COPY tests /app/tests

WORKDIR /app

RUN ./run_tests.sh

ENTRYPOINT ["/app/ctypesgen.py"]
