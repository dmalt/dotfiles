#!/bin/bash

echo $(light | sed -E 's/([0-9]+)\.00/\1/g')

