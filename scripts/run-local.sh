#!/bin/bash
docker run -it -p 8000:8000 --env-file .env.local secretsauce:latest
