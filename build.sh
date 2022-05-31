#!/bin/bash
podman build -t quay.io/apoczeka/container-toolbox:latest . 
podman push quay.io/apoczeka/container-toolbox
