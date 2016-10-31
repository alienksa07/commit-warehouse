FROM scratch
ADD amzn-container-minimal-2016.09.0.20161028-x86_64.tar.xz /
CMD ["/bin/bash"]
RUN curl -o /usr/src/srpm/srpm-bundle.tar.gz "https://s3.amazonaws.com/amazon-linux-docker-sources/srpm-bundle.tar.gz?versionId=BOOVw_RRxOLMdMbXgFnUSdgn8dTyVN17" \
 && echo "22647c2c901a0cd8f516e095fcf5752256e5497bbbf2205fbe5ad19d53fb0193 /usr/src/srpm/srpm-bundle.tar.gz" | sha256sum -c -
