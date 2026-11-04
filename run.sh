#!/bin/bash

##############################################################################################
# Author: Atomicbeast101
# Description: Run Python locally for development purposes.
##############################################################################################

export LOG_LEVEL=DEBUG
export LOG_PATH=''
export MQTT_SERVER='localhost'

.venv/bin/python app.py
