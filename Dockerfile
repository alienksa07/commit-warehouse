FROM scratch
ADD amzn-container-minimal-2018.03.0.20180622-x86_64.tar.xz /
CMD ["/bin/bash"]
RUN mkdir /usr/src/srpm \
 && curl -o /usr/src/srpm/srpm-bundle.tar.gz "https://amazon-linux-docker-sources.s3-accelerate.amazonaws.com/srpm-bundle.tar.gz?versionId=TMSfeX5bVpqLoqjaGnsKXppJNyKOiXNz" \
 && echo "b673f0febfbf13a268de6561bfb24c7ab1018632b5d63879cb79a682b8752b36 /usr/src/srpm/srpm-bundle.tar.gz" | sha256sum -c -
