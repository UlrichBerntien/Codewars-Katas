#!/bin/bash

name="$1"
if  [[ -z $name ]]; then
  name="stranger"
fi
echo "Hello, $name how are you doing today?"
