#!/bin/bash
COMMITHASH=$(git rev-parse --short HEAD)
docker push ghcr.io/0i0/secretsauce:$COMMITHASH
