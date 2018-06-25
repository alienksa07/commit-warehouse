FROM scratch
ADD amzn2-container-raw-2.0.20180622.1-x86_64.tar.xz /
CMD ["/bin/bash"]
RUN mkdir /usr/src/srpm \
 && curl -o /usr/src/srpm/srpm-bundle.tar.gz "https://amazon-linux-docker-sources.s3-accelerate.amazonaws.com/amzn2/srpm-bundle.tar.gz?versionId=rQgURY_SYHqkLFRiaPqzhE7GEJw5liK." \
 && echo "58ddcb36c2bb04995ff9c40d3e102e9137871fc7f13b075c34cefaf0fc516e16 /usr/src/srpm/srpm-bundle.tar.gz" | sha256sum -c -
