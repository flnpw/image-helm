# flnpw/helm

This repo has helm installed for using on multilayer builds, as a installer or
as is.

## How to use

Using this image in a multilayered Dockerfile and fetching helm from it:
```
FROM flnpw/helm AS helm
...
FROM myimage
...
COPY --from=helm /usr/local/bin/helm /<wherever>/helm
...
```

Using this image as a local installer:
```
docker run --rm -ti \
  --entrypoint='' \
  -v /usr/local/bin:/target \
  flnpw/helm \
  cp /usr/local/bin/helm /target
```


