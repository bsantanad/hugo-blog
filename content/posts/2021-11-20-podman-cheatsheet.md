---
title: podman cheatsheet
date: 2021-11-20 12:07:38
author: bsantanad
draft: false
---

# podman cheatsheet

maybe it's quicker to use `man podman` but anyway, here's the cheatsheet.

### podman?

from man-pages: simple management tool for pods, containers and images.
Podman uses buildah to create container images.


### commands

- `podman search --limit int <name>`
  -  search a container image from the registries, the limit flag limits the
     output. The registries path:`/etc/containers/registries*`

- `podman run -it <image>`
  - run image while keeping STDIN even if detached (`i`), also allocate
    pseudo-TTY for container (`t`).
 
- `podman build -t <tag/name> -f <dockerfile>`
  - build container, with tag from dockerfile.

- `podman images`
  - list images in local storage

- `podman images prune`
  - remove all images from local storage, a warning will come up 

- `podman rmi <ID/name>`
  - remove image by ID or name

- `podman inspect <container>`
  - display container information, you can use `-l` to display the info of the
    last container.

- `podman logs <container>`
  - display container logs, you can use `-l` to display the info of the
    last container.

- `podman stop <container>`
  - stop container or containers, you can use `-l` to display the info of the
    last container.

This list will grow with time.
