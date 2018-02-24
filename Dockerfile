FROM scratch
ADD amzn2-container-raw-2017.12.0.20180222-x86_64.tar.xz /
CMD ["/bin/bash"]
RUN mkdir /usr/src/srpm \
 && curl -o /usr/src/srpm/srpm-bundle.tar.gz "https://amazon-linux-docker-sources.s3-accelerate.amazonaws.com/amzn2/srpm-bundle.tar.gz?versionId=BmBczAzkqWrsCFD2Q5vc8iqUyZIE0MG_" \
 && echo "b9d7340dd289dd321545417119df32865f4ae305fdc0fb89549e3c4a50caf5e7 /usr/src/srpm/srpm-bundle.tar.gz" | sha256sum -c -
