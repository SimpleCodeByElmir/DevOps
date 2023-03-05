#!/bin/bash

### IF YOU WANT TO REMOVE FILES IN PATHS WITH 'HIGH ACCESS RIGHTS (etc. ROOT)', THEN RUN THIS SCRIPT AS ROOT / SUDOER.
source input.sh
chmod +x algorithm.sh
source algorithm.sh
exit 0
