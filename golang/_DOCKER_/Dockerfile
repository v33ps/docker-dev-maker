FROM debian:7.11-slim

RUN apt-get update && \
        apt-get install -y \
            git \
            curl \
            wget \
            net-tools 


RUN wget https://dl.google.com/go/go1.11.5.linux-amd64.tar.gz
RUN tar xvfz go1.11.5.linux-amd64.tar.gz
RUN mv go /usr/local/.

# Configure Go
ENV GOROOT /usr/local/go
ENV GOPATH /go
RUN export PATH=$GOPATH/bin:$GOROOT/bin:$PATH

RUN mkdir -p ${GOPATH}/src ${GOPATH}/bin
RUN echo $PATH
# Install Glide
RUN /usr/local/go/bin/go get -u github.com/Masterminds/glide/

WORKDIR $GOPATH
