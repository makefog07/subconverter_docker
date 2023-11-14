#!/bin/bash
CONFIG_DIR="/path/to/subconverter_docker"

docker run -d --net=host \
    --restart unless-stopped \
    -v $CONFIG_DIR/pref.ini:/base/pref.ini \
    -v $CONFIG_DIR/all_base.tpl:/base/base/all_base.tpl \
    -v $CONFIG_DIR:/base/my \
    --name subconverter tindy2013/subconverter
