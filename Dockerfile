FROM busybox

ARG VERSION_TAG=v3.1.2
ENV URL=https://get.helm.sh/helm-$VERSION_TAG-linux-amd64.tar.gz
ENV ARTIFACT=helm.tar.gz
ENV BINARY=helm

ADD $URL /tmp/$ARTIFACT
RUN set -exuo pipefail; \
  mkdir -p /usr/local/bin \
  && tar -xzf /tmp/$ARTIFACT -C /usr/local/bin/ --strip 1 \
  && rm -rf /tmp/$ARTIFACT \
  && chmod 755 /usr/local/bin/$BINARY

ENTRYPOINT ["helm"]
CMD ["--help"]
