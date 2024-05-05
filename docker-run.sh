#!/bin/bash

docker run --rm -it \
	-p 80:80/tcp \
	-p 443:443/tcp \
	-v "/$(pwd)/nginx:/etc/nginx/conf.d/:ro" \
	-v "/$(pwd)/public/:/mnt/public:ro" \
	cpcontinued-media:latest
