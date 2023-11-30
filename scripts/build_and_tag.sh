#!/bin/bash
COMMITHASH=$(git rev-parse --short HEAD)
docker build -t secretsauce:latest .
docker tag secretsauce:latest secretsauce:$COMMITHASH
docker tag secretsauce:$COMMITHASH ghcr.io/0i0/secretsauce:$COMMITHASH
