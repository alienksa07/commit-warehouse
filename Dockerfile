FROM scratch
ADD amzn2-container-raw-2017.12.0.20171212.2-x86_64.tar.xz /
CMD ["/bin/bash"]
RUN mkdir /usr/src/srpm \
 && curl -o /usr/src/srpm/srpm-bundle.tar.gz "https://amazon-linux-docker-sources.s3-accelerate.amazonaws.com/amzn2/srpm-bundle.tar.gz?versionId=zLN.zsz8iZ2mjVR6CQeBS1t_5MSXnQfu" \
 && echo "04c78fbd6ab0f8eb142557365e0b78bfb2f25bdadf3633f666ab4f2846c52a78 /usr/src/srpm/srpm-bundle.tar.gz" | sha256sum -c -
