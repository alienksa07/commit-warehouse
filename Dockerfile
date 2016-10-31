FROM scratch
ADD amzn-container-minimal-2016.09.0.20161118-x86_64.tar.xz /
CMD ["/bin/bash"]
RUN curl -o /usr/src/srpm/srpm-bundle.tar.gz "https://amazon-linux-docker-sources.s3-accelerate.amazonaws.com/srpm-bundle.tar.gz?versionId=EBiOgXZ7Z_KyUmflTkdn7j97bNNHVfuQ" \
 && echo "d02438cec7e187a090b674c3b2e0b25f621356252d56557fcd46de642feca55c /usr/src/srpm/srpm-bundle.tar.gz" | sha256sum -c -
