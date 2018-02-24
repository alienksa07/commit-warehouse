FROM scratch
ADD amzn-container-minimal-2017.09.1.20180222-x86_64.tar.xz /
CMD ["/bin/bash"]
RUN mkdir /usr/src/srpm \
 && curl -o /usr/src/srpm/srpm-bundle.tar.gz "https://amazon-linux-docker-sources.s3-accelerate.amazonaws.com/srpm-bundle.tar.gz?versionId=BV.7nyWyerxY9mAgMwZhtzjodMDqo1Wj" \
 && echo "2ea2b568830c4e569ace5d22b3d637f00ca0c0c584884d6770ed7f0b722d601b /usr/src/srpm/srpm-bundle.tar.gz" | sha256sum -c -
