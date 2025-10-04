#!/bin/bash

b=$(basename $1)
echo "$(dirname $1), ${b/./, }"