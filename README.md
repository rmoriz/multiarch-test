# Let Docker Hub build your multi-arch images (autobuild)

❗️🌟🌟🌟👉(For a working real life example, head over to https://github.com/rmoriz/openra-dockerfile and https://hub.docker.com/r/rmoriz/openra)👈🌟🌟🌟

![](img/multiarch.png)

```shell
# Raspberry Pi Zero W
$ uname -ar
Linux zero2 4.14.79+ #1159 Sun Nov 4 17:28:08 GMT 2018 armv6l GNU/Linux
$ docker inspect rmoriz/multiarch-test:latest | jq ".[].Architecture"
"arm"

# x86_64/amd64 Intel
$ uname -ar
Linux rambo 4.15.0-45-generic #48-Ubuntu SMP Tue Jan 29 16:28:13 UTC 2019 x86_64 x86_64 x86_64 GNU/Linux
$ docker inspect rmoriz/multiarch-test:latest | jq ".[].Architecture"
"amd64"

# manifest
$ docker manifest inspect docker.io/rmoriz/multiarch-test
{
   "schemaVersion": 2,
   "mediaType": "application/vnd.docker.distribution.manifest.list.v2+json",
   "manifests": [
      {
         "mediaType": "application/vnd.docker.distribution.manifest.v2+json",
         "size": 1364,
         "digest": "sha256:2224ef7e13019f5afc68ab80f81aba97b0cd856f091ad027c5096e33a1dfd822",
         "platform": {
            "architecture": "arm64",
            "os": "linux"
         }
      },
      {
         "mediaType": "application/vnd.docker.distribution.manifest.v2+json",
         "size": 1157,
         "digest": "sha256:e9198b702c879b595be9def7fde9983c2a9ba8e9397c378e34a0b919a9229673",
         "platform": {
            "architecture": "amd64",
            "os": "linux"
         }
      },
      {
         "mediaType": "application/vnd.docker.distribution.manifest.v2+json",
         "size": 1364,
         "digest": "sha256:d250f615f25d5192f717cbfe9c0dbfa847f0d5693e0a483bec659c34e373d4b6",
         "platform": {
            "architecture": "arm",
            "os": "linux"
         }
      }
   ]
}
```


## How?

- enable autobuild (build on Github webhook) in repository settings on Docker Hub.
- read, copy and adjust contents of the `hooks` directory and Dockerfile.
- [example build log](https://gist.github.com/rmoriz/4204f1f30eeda3892248e797024ed794)
- [link to repo on docker hub](https://hub.docker.com/r/rmoriz/multiarch-test)


See also: https://docs.docker.com/docker-hub/builds/advanced/
